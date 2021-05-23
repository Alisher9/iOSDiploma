//
//  MovieInnerCollectionViewCell.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/12/21.
//

import UIKit

final class MovieInnerCollectionViewCell: UICollectionViewCell {
    
    var movie: Movie? {
        didSet {
            if let name = movie?.title {
                nameLabel.text = name
            }
            categoryLabel.text = movie?.genres?.last
            if let imageName = movie?.image {
                print("/// image", imageName)
                guard let url = URL(string: imageName) else { return  }
                let data = try? Data(contentsOf: url)
                if let imageData = data {
                    let i = UIImage(data: imageData)
                    image.image = i
                }
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
    
    let image: UIImageView = {
       let image = UIImageView()
        image.image = Asset.failure.image
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
//        label.text = "Sherlock Holmes"
        label.font = FontFamily.SFProDisplay.bold.font(size: 14)
        label.numberOfLines = 2
        return label
    }()
    
    let categoryLabel: UILabel = {
       let label = UILabel()
//        label.text = "Action"
        label.font = FontFamily.SFProDisplay.regular.font(size: 12)
        label.numberOfLines = 2
        label.textColor = ColorName.mainPurple.color
        return label
    }()
    
    
    private func setupViews() {
        backgroundColor = .clear
        
        addSubview(image)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        
        image.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width + 40)
        nameLabel.frame = CGRect(x: 0, y: frame.width + 42, width: frame.width, height: 40)
        categoryLabel.frame = CGRect(x: 0, y: frame.width + 78, width: frame.width, height: 15)
    }
}
