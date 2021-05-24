//
//  HomeViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

import UIKit
import SnapKit

final class HomeViewController: UICollectionViewController {
    
    // MARK: - Public properties
    
    var presenter: HomePresentation?
    
    var movieCategories: [MovieCategory]?
    
    // MARK: - Private properties
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        collectionView.isSkeletonable = true
//        collectionView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .concrete), animation: nil, transition: .crossDissolve(0.25))
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.isHidden = true
        navigationItem.title = "Рекомендации"
        
        
        
        MovieCategory.featuredMovies { (appCategories) -> () in
            print("/// movie", appCategories)

            self.movieCategories = appCategories
//            self.collectionView.stopSkeletonAnimation()
//            self.collectionView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
            self.collectionView?.reloadData()
        }
        
        
        collectionView.backgroundColor = .white
        collectionView.register(HomeMovieCollectionViewCell.self,
                                forCellWithReuseIdentifier: HomeMovieCollectionViewCell.identifier)
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
    }
    
    private func configureConstraints() {
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
}

// MARK: - Extensions

extension HomeViewController: HomeView {
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if let count = movieCategories?.count {
            return count
        }
        return 0
    }
    
    

    override func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMovieCollectionViewCell.identifier, for: indexPath) as! HomeMovieCollectionViewCell
        cell.movieCategory = movieCategories?[indexPath.item]
//        cell.isSkeletonable = true
        cell.viewController = self
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }
    
    func showMovieDetail(movie: Movie) {
        let vc = MovieCardViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - Nested types

private extension HomeViewController {
    
    enum Constants {
    }
    
}
