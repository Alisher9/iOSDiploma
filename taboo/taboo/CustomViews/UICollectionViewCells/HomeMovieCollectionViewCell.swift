//
//  HomeMovieCollectionViewCell.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/12/21.
//

import UIKit

final class HomeMovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "movieCell"
    
    var viewController: HomeViewController?
    
    var movieCategory: MovieCategory? {
        didSet {
            if let name = movieCategory?.name {
                nameLabel.text = name
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Recommendations"
        label.font = FontFamily.SFProDisplay.bold.font(size: 18)
        label.textColor = UIColor.systemYellow
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let dividerLineView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private func setupViews() {
        backgroundColor = .clear

        addSubview(appsCollectionView)
        addSubview(dividerLineView)
        addSubview(nameLabel)

        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        
        appsCollectionView.register(MovieInnerCollectionViewCell.self,
                                    forCellWithReuseIdentifier: "movieInnerCell")
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|",
                                                     options: NSLayoutConstraint.FormatOptions(),
                                                     metrics: nil,
                                                     views: ["v0": nameLabel]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|",
                                                     options: NSLayoutConstraint.FormatOptions(),
                                                     metrics: nil,
                                                     views: ["v0": dividerLineView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|",
                                                     options: NSLayoutConstraint.FormatOptions(),
                                                     metrics: nil,
                                                     views: ["v0": appsCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0][v1(0.5)]|",
                                                     options: NSLayoutConstraint.FormatOptions(),
                                                     metrics: nil,
                                                     views: ["v0": appsCollectionView,
                                                             "v1": dividerLineView,
                                                             "nameLabel": nameLabel]))
    }

}

extension HomeMovieCollectionViewCell: UICollectionViewDataSource,
                                       UICollectionViewDelegate,
                                       UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
//        if let count = movieCategory?.movies?.count {
//             return count
//        }
        return 5
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieInnerCell",
                                                       for: indexPath) as! MovieInnerCollectionViewCell
//        cell.movie = movieCategory?.movies?[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height - 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,
                            left: 14,
                            bottom: 0,
                            right: 14)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let movie = movieCategory?.movies?[indexPath.item] {
        viewController?.showMovieDetail(movie: movieCategory?.movies?.first ?? Movie())
//        }
    }

}
