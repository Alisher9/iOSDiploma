//
//  WeatherCell.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/21/21.
//

import UIKit
import SnapKit

final class WeatherCell: UITableViewCell {
    
    // MARK: - Public properties
    var title: String?
    var category: String?
    var imageFileName: String?
    var rating: String?
    
    var viewModel: WeatherCellViewModel? {
        didSet {
            nameLabel.text = viewModel?.title
            categoryLabel.text = viewModel?.category
            ratingLabel.text = viewModel?.rating
            if let fileName = viewModel?.image {
                movieImageView.setImage(fileName: fileName)
            } else {
                movieImageView.image = nil
            }
        }
    }
    
    // MARK: - Private properties
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.weatherColor.color
        label.numberOfLines = 0
        label.text = "Гнев человеческий"
        label.font = FontFamily.SFProDisplay.bold.font(size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var movieImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = ColorName.lightGray.color
        view.layer.cornerRadius = 5.0
        view.layer.masksToBounds = true
        view.image = Asset.weatherImage.image
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorName.mainPurple.color
        label.text = "Боевик, ‎триллер‎"
        label.numberOfLines = 0
        label.font = FontFamily.SFProDisplay.regular.font(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.weatherColor.color
        label.numberOfLines = 1
        label.text = "Рейтинг:"
        label.font = FontFamily.SFProDisplay.regular.font(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ratingTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.weatherColor.color
        label.numberOfLines = 1
        label.text = "7.4"
        label.font = FontFamily.SFProDisplay.regular.font(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubviews(
            nameLabel,
            movieImageView,
            categoryLabel,
            ratingLabel,
            ratingTextLabel
        )
    }
    
    private func configureConstraints() {
        movieImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.top.equalToSuperview().offset(8)
            $0.height.equalTo(110)
            $0.width.equalTo(200)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(movieImageView.snp.trailing).offset(12)
            $0.top.equalToSuperview().offset(8)
        }
        categoryLabel.snp.makeConstraints {
            $0.leading.equalTo(movieImageView.snp.trailing).offset(12)
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
        }
        ratingLabel.snp.makeConstraints {
            $0.bottom.equalTo(movieImageView.snp.bottom)
            $0.leading.equalTo(movieImageView.snp.trailing).offset(12)
        }
        ratingTextLabel.snp.makeConstraints {
            $0.bottom.equalTo(movieImageView.snp.bottom)
            $0.leading.equalTo(ratingLabel.snp.trailing).offset(4)
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    func configure(with model: WeatherCellViewModel) {
        guard let url = URL(string: model.image ?? "") else { return  }
        let data = try? Data(contentsOf: url)
        if let imageData = data {
            let i = UIImage(data: imageData)
            movieImageView.image = i
        }
        nameLabel.text = model.title
        categoryLabel.text = model.category
        ratingTextLabel.text = model.rating
    }
}
