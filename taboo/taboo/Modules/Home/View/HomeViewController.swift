//
//  HomeViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

import UIKit
import SnapKit

final class HomeViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var presenter: HomePresentation?
    
    // MARK: - Private properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.backgroundColor = .white
//        let layout = UICollectionViewFlowLayout()
//        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionview.backgroundColor = .red
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(HomeMovieCollectionViewCell.self,
//                                forCellWithReuseIdentifier: HomeMovieCollectionViewCell.identifier)
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        title = "Main"
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
//        view.addSubview(collectionView)
    }
    
    private func configureConstraints() {
//        collectionView.snp.makeConstraints {
//            $0.leading.trailing.equalToSuperview()
//            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
//        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
}

// MARK: - Extensions

extension HomeViewController: HomeView {
}

//extension HomeViewController {
//    override func collectionView(_ collectionView: UICollectionView,
//                        numberOfItemsInSection section: Int) -> Int {
//        return 3
//    }
//
//    override func collectionView(_ collectionView: UICollectionView,
//                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMovieCollectionViewCell.identifier, for: indexPath) as! HomeMovieCollectionViewCell
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: 150)
//    }
//
//
//}

// MARK: - Nested types

private extension HomeViewController {
    
    enum Constants {
    }
    
}
