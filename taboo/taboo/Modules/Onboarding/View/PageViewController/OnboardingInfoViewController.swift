//
//  OnboardingInfoViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/25/21.
//

import UIKit

final class OnboardingInfoViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var model: OnboardingInfoModel? {
        didSet {
            titleLabel.text = model?.title
            descriptionLabel.text = model?.description
        }
    }
    
    // MARK: - Private properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorName.textBlack.color
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorName.darkGray.color
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubviews(titleLabel, descriptionLabel)
    }
    
    private func configureConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
        }
    }
    
}

