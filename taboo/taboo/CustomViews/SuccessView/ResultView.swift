//
//  ResultView.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/15/21.
//

import UIKit
import SnapKit

final class ResultView: UIView {
    
    // MARK: - Public properties
    
    var detailText: String? {
        didSet {
            detailLabel.text = detailText
        }
    }
    
    var isSuccess = true {
        didSet {
            resultImageView.image = isSuccess ? Asset.success.image : Asset.failure.image
            resultLabel.text = isSuccess ? L10n.Common.success : L10n.Common.failure
        }
    }
    
    var closeAction: (() -> Void)?
    
    // MARK: - Private properties
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.setImage(Asset.cross.image, for: .normal)
        button.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var resultImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = Asset.success.image
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorName.textBlack.color
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = L10n.Common.success
        label.font = FontFamily.SFProDisplay.bold.font(size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorName.darkGray.color
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = FontFamily.SFProDisplay.regular.font(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        backgroundColor = .white
        layer.masksToBounds = true
        layer.cornerRadius = 10
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubviews(closeButton, resultImageView, resultLabel, detailLabel)
    }
    
    private func configureConstraints() {
        closeButton.snp.makeConstraints {
            $0.size.equalTo(50)
            $0.top.trailing.equalToSuperview()
        }
        
        resultImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(50)
            $0.width.equalToSuperview().multipliedBy(0.66)
            $0.height.equalTo(resultImageView.snp.width).multipliedBy(0.65)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(resultImageView.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview()
        }
        
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(resultLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
    @objc private func didTapClose() {
        closeAction?()
    }
    
}
