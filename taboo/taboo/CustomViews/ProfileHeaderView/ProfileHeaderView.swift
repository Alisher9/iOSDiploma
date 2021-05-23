//
//  ProfileHeaderView.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//

import UIKit

protocol ProfileHeaderViewDelegate: class {
    func settingsIconTapped()
    func profileImageTapped()
}

final class ProfileHeaderView: UIView {
    
    // MARK: - Public properties
  
    weak var delegate: ProfileHeaderViewDelegate?
    
    var viewModel: ProfileHeaderViewModel? {
        didSet {
            avatarImageView.image = viewModel?.profileImage
            avatarImageView.viewModel = AvatarImageViewModel(name: viewModel?.name,
                                                             surname: viewModel?.surname)
            nameLabel.text = "\(viewModel?.surname ?? "") \(viewModel?.name ?? "")"
            phoneLabel.text = viewModel?.phone
        }
    }
    
    var offset: CGFloat = 0 {
        didSet {
            let maxOffset: CGFloat = 190
            offset = min(maxOffset, offset)
            transform = CGAffineTransform(translationX: 0, y: -offset)
            
            let percent = min(1.0, 1.0 - offset / (maxOffset / 2.0))
            
            avatarImageView.alpha = percent
            nameLabel.alpha = percent
            addressLabel.alpha = percent
            phoneLabel.alpha = percent
            settingsIcon.alpha = percent
            
        }
    }
    
    // MARK: - Private proerties
    
    private lazy var avatarImageView: AvatarImageView = {
       let image = AvatarImageView(editable: true)
        image.delegate = self
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.font = FontFamily.SFProDisplay.bold.font(size: 18)
        label.textColor = ColorName.textBlack.color
        return label
    }()
    
    private lazy var addressLabel: UILabel = {
       let label = UILabel()
        label.font = FontFamily.SFProDisplay.regular.font(size: 14)
        label.textColor = ColorName.textBlack.color
        return label
    }()
    
    private lazy var phoneLabel: UILabel = {
       let label = UILabel()
        label.font = FontFamily.SFProDisplay.regular.font(size: 14)
        label.textColor = ColorName.textBlack.color
        return label
    }()
    
    private lazy var favoriteLabel: UILabel = {
       let label = UILabel()
        label.font = FontFamily.SFProDisplay.bold.font(size: 17)
        label.text = "Внизу отображаются Ваши избранные фильмы"
        label.textColor = ColorName.mainPurple.color
        return label
    }()
    
    private lazy var settingsIcon: UIImageView = {
        var image = UIImageView()
        image.image = Asset.settingsIcon.image
        image.isUserInteractionEnabled = true
        let iconTappedGesture = UITapGestureRecognizer()
        iconTappedGesture.addTarget(self, action: #selector(settingsIconTapped))
        image.addGestureRecognizer(iconTappedGesture)
        return image
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        
        addSubviews(avatarImageView,
                    nameLabel,
                    addressLabel,
                    phoneLabel,
                    favoriteLabel,
                    settingsIcon)
    }
    
    private func configureConstraints() {
        
        avatarImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(46)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(70)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(avatarImageView.snp.bottom).offset(21)
            $0.centerX.equalToSuperview()
        }
        
        addressLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        phoneLabel.snp.makeConstraints {
            $0.top.equalTo(addressLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        favoriteLabel.snp.makeConstraints {
            $0.top.equalTo(phoneLabel.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(21)
        }
        
        
        settingsIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.height.equalTo(20)
        }
    }
    
    // MARK: - Public actions

    // MARK: - Private actions
    
    @objc private func settingsIconTapped() {
        delegate?.settingsIconTapped()
    }
}

extension ProfileHeaderView: AvatarImageViewDelegate {
    func imageTapped() {
        delegate?.profileImageTapped()
    }
}
