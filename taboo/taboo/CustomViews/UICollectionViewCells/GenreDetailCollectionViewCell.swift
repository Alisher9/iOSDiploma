//
//  GenreDetailCollectionViewCell.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/20/21.
//

import UIKit

final class GenreDetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GenreDetailCollectionViewCell"
    
    private var imgs: [String] = ["film",
                                    "tv",
                                    "tv.music.note",
                                    "music.note",
                                    "music.mic",
                                    "music.house",
                                    "power",
                                    "stopwatch",
                                    "gamecontroller",
                                    "headphones",
                                    "flame",
                                    "ant",
                                    "bolt",
                                    "hare"]
    
    private let imageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        return image
    }()
    
    private let label: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private var colors: [UIColor] = [
        .systemPurple,
        .systemRed,
        .systemYellow,
        .systemBlue,
        .systemGreen,
        .systemOrange,
        .systemTeal,
        .systemGray,
        .systemIndigo,
        .systemGray2
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        label.frame = CGRect(x: 10,
//                             y: contentView.bounds.height / 2,
//                             width: contentView.bounds.width - 20,
//                             height: contentView.bounds.height / 2)
        
//        imageView.frame = CGRect(x: contentView.bounds.width / 2,
//                                 y: 0,
//                                 width: contentView.bounds.width / 2,
//                                 height: contentView.bounds.height / 2)
    }
    
    func setupViews() {
        addSubviews(label, imageView)
        label.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(with title: String) {
        label.text = title
        imageView.image = Asset.success.image
        contentView.backgroundColor = colors.randomElement()
    }
}
