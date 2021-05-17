//
//  MovieCardViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/17/21.
//  
//

import UIKit

final class MovieCardViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var presenter: MovieCardPresentation?
    
    // MARK: - Private properties
    
    private var movie: Film? {
        didSet {
            if let imageURLs = movie?.imageURLs {
                movieHeaderView.imageURLs = imageURLs
            }
            titleLabel.text = movie?.name
            descriptionLabel.text = movie?.category
            
        }
    }
    
    private var movieType: FilmType? {
        didSet {
//            contactView.advertisementType = advertisementType
        }
    }
    
    private lazy var movieHeaderView: MultipleImagesView = {
        let view = MultipleImagesView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var movieHeaderViewHeightConstraint: NSLayoutConstraint?
    private var movieHeaderViewTopConstraint: NSLayoutConstraint?
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .clear
        view.contentInset = UIEdgeInsets(top: Constants.movieHeaderViewHeight,
                                         left: 0,
                                         bottom: 0,
                                         right: 0)
        view.showsVerticalScrollIndicator = false
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorName.mainPurple.color
        label.numberOfLines = 3
        label.font = FontFamily.SFProDisplay.bold.font(size: 34)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorName.textBlack.color
        label.numberOfLines = 0
        label.text = """
        Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet
        Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet
        Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet
        Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet
        """
        label.font = FontFamily.SFProDisplay.regular.font(size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = ColorName.lightGray.color
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.setImage(Asset.back.image, for: .normal)
        button.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var navBar: MovieCardNavBarView = {
        let view = MovieCardNavBarView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 3
        view.backgroundColor = UIColor.white.withAlphaComponent(0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(titleLabel, descriptionLabel)
        
        view.addSubviews(scrollView, movieHeaderView, navBar, backButton)
        
        navigationBarHidden = true
        additionalSafeAreaInsets = UIEdgeInsets.zero
        
    }
    
    private func configureConstraints() {
        movieHeaderView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        movieHeaderViewTopConstraint = movieHeaderView.topAnchor.constraint(equalTo: view.topAnchor,
                                                                            constant: -1)
        movieHeaderViewHeightConstraint = movieHeaderView.heightAnchor.constraint(
            equalToConstant: Constants.movieHeaderViewHeight
        )
        movieHeaderViewTopConstraint?.isActive = true
        movieHeaderViewHeightConstraint?.isActive = true
        
        contentView.snp.makeConstraints {
            $0.top.bottom.width.centerX.equalToSuperview()
        }
        scrollView.snp.makeConstraints {
            $0.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(22)
        }
        descriptionLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalTo(titleLabel.snp.bottom).offset(14)
        }
        
        navBar.snp.makeConstraints {
            $0.leading.top.trailing.equalTo(movieHeaderView)
            $0.bottom.equalTo(movieHeaderView).offset(1)
        }
        backButton.snp.makeConstraints {
            $0.size.equalTo(40)
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
}

// MARK: - Extensions

extension MovieCardViewController: MovieCardView {
    func update(with movie: Film, movieType: FilmType) {
        self.movie = movie
        self.movieType = movieType
    }
    
    func update(with user: User) {
        
    }
}

extension MovieCardViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = Constants.movieHeaderViewHeight
        let treshold = Constants.movieHeaderViewShrinkThreshold
        let offset = scrollView.contentOffset.y + height
        if offset <= treshold {
            movieHeaderViewHeightConstraint?.constant = height - offset
            movieHeaderViewTopConstraint?.constant = -1
        } else {
            movieHeaderViewHeightConstraint?.constant = height - treshold
            let translation = max(treshold - height + 21 + Constants.navbarHeight, treshold - offset)
            movieHeaderViewTopConstraint?.constant = translation - 1
        }
        
        let maxOffset = Constants.movieHeaderViewHeight - Constants.navbarHeight - 20
        let percent = min(offset / maxOffset, 1)
        navBar.backgroundColor = UIColor.white.withAlphaComponent(percent)
    }
}

// MARK: - Nested types

private extension MovieCardViewController {
    
    enum Constants {
        static let movieHeaderViewHeight: CGFloat = 288
        static let movieHeaderViewShrinkThreshold: CGFloat = 88
        static let navbarHeight: CGFloat = 56
    }
    
}
