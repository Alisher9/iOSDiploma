//
//  MovieFrameCell.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/19/21.
//

import UIKit

final class MovieFrameCell: UICollectionViewCell {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize.zero
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)

        return cv
    }()
    
    var arr = ["112", "113", "111"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        collectionView.register(MovieFrameImageCell.self, forCellWithReuseIdentifier: "cellId")
    }
}


extension UIView {
    func addContraintsWithFormat(_ format: String, views: UIView...) {
            var viewDict = [String: UIView]()

            for (index, view) in views.enumerated() {
                let key = "v\(index)"
                view.translatesAutoresizingMaskIntoConstraints = false
                viewDict[key] = view
            }

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDict))
        }
}

extension MovieFrameCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! MovieFrameImageCell
        cell.configure(with: arr[indexPath.row])
        cell.imageView.image = UIImage(named: arr[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
    }
    
}


class MovieFrameImageCell: UICollectionViewCell {
    
    var imageView: UIImageView = {
       let image = UIImageView()
//        image.image = UIImage(named: "111")
        image.layer.cornerRadius = 5
        image.backgroundColor = ColorName.lightGray.color
        image.contentMode = .scaleAspectFill
        return image
    }()

    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupCell() {
        addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(with model: String) {
        imageView.image = UIImage(named: model)
    }
    
    
}
