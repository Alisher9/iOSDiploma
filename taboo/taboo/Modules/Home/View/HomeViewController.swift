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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        MovieCategory.featuredMovies { (appCategories) -> () in
//
//            self.movieCategories = appCategories
//            self.collectionView?.reloadData()
//        }
        
        collectionView.backgroundColor = .white
        collectionView.register(HomeMovieCollectionViewCell.self,
                                forCellWithReuseIdentifier: HomeMovieCollectionViewCell.identifier)
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        title = "Main"
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
//        if let count = movieCategories?.count {
//            return count
//        }
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMovieCollectionViewCell.identifier, for: indexPath) as! HomeMovieCollectionViewCell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
}

// MARK: - Nested types

private extension HomeViewController {
    
    enum Constants {
    }
    
}
