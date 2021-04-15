//
//  LoginViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/23/21.
//  
//

import UIKit
import SnapKit

final class IndicatableButton: UIButton, IndicatableView {}

final class LoginViewController: BaseViewController, UITextFieldDelegate {
    
    // MARK: - Public properties
    
    var presenter: LoginPresentation?
    
    // MARK: - Private properties
    
    private lazy var logoTitle: UILabel = {
       let label = UILabel()
        label.text = L10n.Common.app
        label.textColor = ColorName.mainPurple.color
        label.font = FontFamily.SFProDisplay.bold.font(size: 44)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var enterTitleLabel: UILabel = {
       let label = UILabel()
        label.text = L10n.Login.enter
        label.font = FontFamily.SFProDisplay.bold.font(size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var phoneNumberTextField: MainTextField = {
        let textField = MainTextField(style: .phoneNumber)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: MainTextField = {
        let textField = MainTextField(style: .password)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var forgetPasswordLabel: UILabel = {
       let label = UILabel()
        label.text = L10n.Login.forgetPassword
        label.font = FontFamily.SFProDisplay.regular.font(size: 14)
        label.textColor = ColorName.mainPurple.color
        return label
    }()
    
    private lazy var loginButton: MainButton = {
        let button = MainButton()
        button.isActive = true
        button.setTitle(L10n.Login.enter, for: .normal)
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var footerStackView = UIStackView()
    
    private lazy var noAccountLabel: UILabel = {
       let label = UILabel()
        label.text = L10n.Login.noAccount
        label.font = FontFamily.SFProDisplay.regular.font(size: 14)
        label.textColor = ColorName.textBlack.color
        return label
    }()
    
    private lazy var registrationLabel: UILabel = {
       let label = UILabel()
        label.text = L10n.Login.registration
        label.font = FontFamily.SFProDisplay.regular.font(size: 14)
        label.textColor = ColorName.mainPurple.color
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapSignUp))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tapGestureRecognizer)
        
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
        
        view.addSubviews(logoTitle,
                         enterTitleLabel,
                         phoneNumberTextField,
                         passwordTextField,
                         forgetPasswordLabel,
                         loginButton,
                         footerStackView)

        footerStackView.addSubviews(noAccountLabel,
                                    registrationLabel)
    }
    
    private func configureConstraints() {
        
        logoTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(154)
        }
        
        enterTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoTitle.snp.bottom).offset(8)
        }
        
        phoneNumberTextField.snp.makeConstraints {
            $0.top.equalTo(enterTitleLabel.snp.bottom).offset(53)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.84)
            $0.height.equalTo(50)
            $0.bottom.equalTo(passwordTextField.snp.top).inset(-19)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.84)
            $0.height.equalTo(50)
            $0.bottom.equalTo(forgetPasswordLabel.snp.top).offset(-9)
        }
        
        forgetPasswordLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().offset(54)
        }

        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgetPasswordLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(37)
            $0.height.equalTo(50)
        }
        
        footerStackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        noAccountLabel.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
        }
        
        registrationLabel.snp.makeConstraints {
            $0.trailing.top.bottom.equalToSuperview()
            $0.left.equalTo(noAccountLabel.snp.right).offset(3)
        }

    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
    @objc private func didTapLogin() {
        guard let phoneNumber = phoneNumberTextField.text?.toPhoneNumber(),
            let password = passwordTextField.text else {
                return
        }
        phoneNumberTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        presenter?.didTapLogin(phoneNumber: phoneNumber, password: password)
    }
    
    @objc private func didTapSignUp() {
        presenter?.didTapSignUp()
    }
    
}

// MARK: - Extensions

extension LoginViewController: LoginView {
    func showActivityIndicator() {
        loginButton.showActivityIndicator()
    }
    func hideActivityIndicator() {
        loginButton.hideActivityIndicator()
    }
}
// MARK: - Nested types

private extension LoginViewController {
    
    enum Constants {
    }
    
}
