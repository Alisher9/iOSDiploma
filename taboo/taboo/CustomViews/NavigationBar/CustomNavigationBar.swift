//
//  CustomNavigationBar.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import UIKit
import SnapKit

protocol MainNavigationBarDelegate: class {
    func didTapBack()
}

final class MainNavigationBar: UIView {

    // MARK: - Public properties
    
    weak var delegate: MainNavigationBarDelegate?
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    // MARK: - Private properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorName.textBlack.color
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = FontFamily.SFProDisplay.bold.font(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
//        button.setImage(Asset.Common.back.image, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 18, left: 20, bottom: 18, right: 20)
        button.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        clipsToBounds = false
        backgroundColor = .white
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubviews(titleLabel, backButton)
    }
    
    private func configureConstraints() {
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(62)
        }
        backButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.leading.equalToSuperview().offset(26)
            $0.width.height.equalTo(50)
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
    @objc private func didTapBack() {
        delegate?.didTapBack()
    }
    
}
