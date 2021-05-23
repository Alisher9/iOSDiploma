//
//  MovieCell.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/17/21.
//

import UIKit
import SnapKit
import Kingfisher

final class MovieCell: UITableViewCell {
    
    // MARK: - Public properties
    var title: String?
    var category: String?
    var imageFileName: String?
    var rating: String?
    
    var viewModel: MovieProfileViewModel? {
        didSet {
            guard let res = viewModel?.favourites else { return }
            
            
//            for i in res {
//                print("ans", i)
            nameLabel.text = viewModel?.favourites.first?.title
                categoryLabel.text = viewModel?.favourites.first?.category
                ratingTextLabel.text = viewModel?.favourites.first?.rating
                if let fileName = viewModel?.favourites.first?.image {
    //                movieImageView.setImage(fileName: fileName)
                    guard let url = URL(string: fileName) else { return  }
                    let data = try? Data(contentsOf: url)
                    if let imageData = data {
                        let i = UIImage(data: imageData)
                        movieImageView.image = i
                    }

                }
//            }
            
//            nameLabel.text = res.map({$0.title!}).first
//            categoryLabel.text = res.map({$0.category!}).first
//            ratingTextLabel.text = res.map({$0.rating!}).first
//            if let fileName = res.map({$0.image!}).first {
//
//                guard let url = URL(string: fileName) else { return  }
//                let data = try? Data(contentsOf: url)
//                if let imageData = data {
//                    let i = UIImage(data: imageData)
//                    movieImageView.image = i
//                }
//
//            }
        }
    }
    
    // MARK: - Private properties
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorName.textBlack.color
        label.numberOfLines = 1
        label.text = "name"
        label.font = FontFamily.SFProDisplay.bold.font(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var movieImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = ColorName.lightGray.color
        view.layer.cornerRadius = 5.0
        view.layer.masksToBounds = true
        view.image = Asset.failure.image
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorName.mainPurple.color
        label.text = "category"
        label.numberOfLines = 0
        label.font = FontFamily.SFProDisplay.regular.font(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorName.textBlack.color
        label.numberOfLines = 1
        label.text = "Rating:"
        label.font = FontFamily.SFProDisplay.regular.font(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ratingTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorName.textBlack.color
        label.numberOfLines = 1
        label.text = "9.5"
        label.font = FontFamily.SFProDisplay.regular.font(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorName.lightGray.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
            ratingTextLabel,
            separatorView
        )
    }
    
    private func configureConstraints() {
        movieImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalTo(snp.centerX)
            $0.height.equalTo(90)
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
        separatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.top.equalTo(movieImageView.snp.bottom).offset(14)
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
}

