//
//  AvatarImageView.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//

import UIKit

protocol AvatarImageViewDelegate: class {
    func imageTapped()
}

final class AvatarImageView: UIImageView {
    
    // MARK: - Public properties
    
    weak var delegate: AvatarImageViewDelegate?
    
    override var image: UIImage? {
        didSet {
            super.image = image
        }
    }
 
    var viewModel: AvatarImageViewModel? {
        didSet {
            if image == nil,
                let nameFirstLetter = viewModel?.name?.first,
                let surnameFirstLetter = viewModel?.surname?.first {
                    initialsLabel.text =  "\(nameFirstLetter)\(surnameFirstLetter)"
                } else {
                    initialsLabel.text = ""
                }
        }
    }
    
    // MARK: - Private properties
    
    private lazy var initialsLabel = UILabel()

    // MARK: - Lifecycle
    
    init(editable: Bool) {
        super.init(frame: .zero)
        self.isUserInteractionEnabled = editable
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        backgroundColor = ColorName.lightGray.color
        layer.cornerRadius = 35
        layer.masksToBounds = true
        clipsToBounds = true
        contentMode = .scaleAspectFill
        
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubview(initialsLabel)
        addGestureToImage()
    }
    
    private func configureConstraints() {
        initialsLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Private actions
    
    private func addGestureToImage() {
        let iconTappedGesture = UITapGestureRecognizer()
        iconTappedGesture.addTarget(self, action: #selector(profileImageTapped))
        addGestureRecognizer(iconTappedGesture)
    }
    
    @objc private func profileImageTapped() {
        delegate?.imageTapped()
    }
}
