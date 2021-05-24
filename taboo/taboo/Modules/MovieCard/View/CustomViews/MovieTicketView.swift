//
//  MovieTicketView.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/18/21.
//

import UIKit
import SnapKit

final class MovieTicketView: UIView,
                             UICollectionViewDataSource,
                             UICollectionViewDelegate,
                             UICollectionViewDelegateFlowLayout {
    
    var model: MovieCard? {
        didSet {
            movieReleaseLabel.text = model?.year ?? ""
            movieCountryLabel.text = model?.country ?? ""
            movieGenreLabel.text = model?.genres.first ?? ""
            movieDirectorLabel.text = model?.directors.first ?? ""
            movieDurationLabel.text = model?.duration ?? ""
            movieActorsLabel.text = model?.actors.first ?? ""
            
        }
    }
    
    private lazy var ticketImage: UIImageView = {
       let image = UIImageView()
        image.image = Asset.ticket.image
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var movieDetailsLabel: UILabel = {
       let label = UILabel()
        label.text = "Детали фильма"
        label.textColor = Color.white
        label.font = FontFamily.SFProDisplay.bold.font(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var releaseLabel: UILabel = {
       let label = UILabel()
        label.text = "Год выпуска"
        label.font = FontFamily.SFProDisplay.regular.font(size: 12)
        label.textColor = Color.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var releaseConnectorLabel: UILabel = {
       let label = UILabel()
        label.text = "............................................................"
        label.numberOfLines = 1
        label.textColor = Color.white
        label.font = FontFamily.SFProDisplay.bold.font(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var movieReleaseLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.text = "2009"
        label.textColor = Color.white
        label.font = FontFamily.SFProDisplay.bold.font(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var releaseStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 5
        return stack
    }()
    
    private lazy var countryLabel: UILabel = {
       let label = UILabel()
        label.text = "Страна"
        label.font = FontFamily.SFProDisplay.regular.font(size: 12)
        label.textColor = Color.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var countryConnectorLabel: UILabel = {
       let label = UILabel()
        label.text = "............................................................"
        label.numberOfLines = 1
        label.textColor = Color.white
        label.font = FontFamily.SFProDisplay.bold.font(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var movieCountryLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.text = "USA"
        label.textColor = Color.white
        label.font = FontFamily.SFProDisplay.bold.font(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var countryStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 5
        return stack
    }()
    
    private lazy var genreLabel: UILabel = {
       let label = UILabel()
        label.text = "Жанр"
        label.font = FontFamily.SFProDisplay.regular.font(size: 12)
        label.textColor = Color.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genreConnectorLabel: UILabel = {
       let label = UILabel()
        label.text = "............................................................"
        label.numberOfLines = 1
        label.textColor = Color.white
        label.font = FontFamily.SFProDisplay.bold.font(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var movieGenreLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.text = "family,comedy"
        label.textColor = Color.white
        label.font = FontFamily.SFProDisplay.bold.font(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genreStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 5
        return stack
    }()
    
    private lazy var directorLabel: UILabel = {
       let label = UILabel()
        label.text = "Режиссер"
        label.font = FontFamily.SFProDisplay.regular.font(size: 12)
        label.textColor = Color.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var directorConnectorLabel: UILabel = {
       let label = UILabel()
        label.text = "........................................."
        label.numberOfLines = 1
        label.textColor = Color.white
        label.font = FontFamily.SFProDisplay.bold.font(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var movieDirectorLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.text = "David John"
        label.textColor = Color.white
        label.font = FontFamily.SFProDisplay.bold.font(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var directorStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 5
        return stack
    }()
    
    private lazy var durationLabel: UILabel = {
       let label = UILabel()
        label.text = "Длительность"
        label.font = FontFamily.SFProDisplay.regular.font(size: 12)
        label.textColor = Color.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var durationConnectorLabel: UILabel = {
       let label = UILabel()
        label.text = "............................................................"
        label.numberOfLines = 1
        label.textColor = Color.white
        label.font = FontFamily.SFProDisplay.bold.font(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var movieDurationLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.text = "120 min"
        label.textColor = Color.white
        label.font = FontFamily.SFProDisplay.bold.font(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var durationStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 5
        return stack
    }()
    
    private lazy var frameLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.text = "Кадры"
        label.font = FontFamily.SFProDisplay.bold.font(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private lazy var actorsLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.text = "Актеры"
        label.font = FontFamily.SFProDisplay.bold.font(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private lazy var actorsConnectorLabel: UILabel = {
       let label = UILabel()
        label.text = ".................................................."
        label.numberOfLines = 1
        label.textColor = Color.white
        label.font = FontFamily.SFProDisplay.bold.font(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var movieActorsLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.text = "Alisher"
        label.textColor = Color.white
        label.font = FontFamily.SFProDisplay.bold.font(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var actorsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 5
        return stack
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize.zero
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.alwaysBounceHorizontal = true
        cv.showsHorizontalScrollIndicator = true
        cv.isScrollEnabled = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MovieFrameCell.self, forCellWithReuseIdentifier: "frameCell")
        cv.clipsToBounds = true
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.dataSource = self
        collectionView.delegate = self
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
        addSubview(ticketImage)
        ticketImage.addSubview(movieDetailsLabel)
        
        releaseStackView.addArrangedSubview(releaseLabel)
        releaseStackView.addArrangedSubview(releaseConnectorLabel)
        releaseStackView.addArrangedSubview(movieReleaseLabel)
        
        countryStackView.addArrangedSubview(countryLabel)
        countryStackView.addArrangedSubview(countryConnectorLabel)
        countryStackView.addArrangedSubview(movieCountryLabel)
        
        genreStackView.addArrangedSubview(genreLabel)
        genreStackView.addArrangedSubview(genreConnectorLabel)
        genreStackView.addArrangedSubview(movieGenreLabel)
        
        directorStackView.addArrangedSubview(directorLabel)
        directorStackView.addArrangedSubview(directorConnectorLabel)
        directorStackView.addArrangedSubview(movieDirectorLabel)
        
        durationStackView.addArrangedSubview(durationLabel)
        durationStackView.addArrangedSubview(durationConnectorLabel)
        durationStackView.addArrangedSubview(movieDurationLabel)
        
        actorsStackView.addArrangedSubview(actorsLabel)
        actorsStackView.addArrangedSubview(actorsConnectorLabel)
        actorsStackView.addArrangedSubview(movieActorsLabel)
        
        ticketImage.addSubviews(releaseStackView,
                                countryStackView,
                                genreStackView,
                                directorStackView,
                                durationStackView,
                                actorsStackView)
        
        ticketImage.addSubviews(frameLabel)
        
        ticketImage.addSubviews(collectionView)
    }
    
    private func configureConstraints() {
        ticketImage.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        movieDetailsLabel.snp.makeConstraints {
            $0.top.equalTo(ticketImage.snp.top).offset(66)
            $0.left.equalToSuperview().offset(26)
        }
        
        releaseStackView.snp.makeConstraints {
            $0.top.equalTo(movieDetailsLabel.snp.bottom).offset(6)
            $0.left.equalToSuperview().offset(26)
            $0.right.equalToSuperview().offset(-26)
        }
        
        countryStackView.snp.makeConstraints {
            $0.top.equalTo(releaseStackView.snp.bottom).offset(6)
            $0.left.equalToSuperview().offset(26)
            $0.right.equalToSuperview().offset(-26)
        }
        
        genreStackView.snp.makeConstraints {
            $0.top.equalTo(countryStackView.snp.bottom).offset(6)
            $0.left.equalToSuperview().offset(26)
            $0.right.equalToSuperview().offset(-26)
        }
        
        directorStackView.snp.makeConstraints {
            $0.top.equalTo(genreStackView.snp.bottom).offset(6)
            $0.left.equalToSuperview().offset(26)
            $0.right.equalToSuperview().offset(-26)
        }
        
        durationStackView.snp.makeConstraints {
            $0.top.equalTo(directorStackView.snp.bottom).offset(6)
            $0.left.equalToSuperview().offset(26)
            $0.right.equalToSuperview().offset(-26)
        }
        
        frameLabel.snp.makeConstraints {
            $0.top.equalTo(durationStackView.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(26)
            $0.right.equalToSuperview().offset(-26)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(frameLabel.snp.bottom).offset(2)
            $0.left.equalToSuperview().offset(26)
            $0.right.equalToSuperview().offset(-26)
            $0.height.equalTo(60)
        }
        
        actorsStackView.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(26)
            $0.right.equalToSuperview().offset(-26)
        }
         
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "frameCell", for: indexPath) as! MovieFrameCell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: collectionView.frame.height - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
    }
    
    
}
