//
//  MultipleImagesCollectionViewCell.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/17/21.
//

import UIKit

final class MultipleImagesCollectionViewCell: UICollectionViewCell {
    
    // MARK: Public properties

    var imageView: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "111")
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
}
