//
//  HomeMovieCollectionViewCell.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/12/21.
//

import UIKit

final class HomeMovieCollectionViewCell: UICollectionViewCell {
    static let identifier = "movieCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .red
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private func setupViews() {
        backgroundColor = .blue

        addSubview(appsCollectionView)

        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        
        appsCollectionView.register(MovieInnerCollectionViewCell.self,
                                    forCellWithReuseIdentifier: "movieInnerCell")

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|",
                                                     options: NSLayoutConstraint.FormatOptions(),
                                                     metrics: nil,
                                                     views: ["v0": appsCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|",
                                                     options: NSLayoutConstraint.FormatOptions(),
                                                     metrics: nil,
                                                     views: ["v0": appsCollectionView]))
    }

}

extension HomeMovieCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "movieInnerCell", for: indexPath)
    }


}
