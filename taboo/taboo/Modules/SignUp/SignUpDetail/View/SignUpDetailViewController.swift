//
//  SignUpDetailViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/15/21.
//  
//

import UIKit
import SnapKit

final class SignUpDetailViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var presenter: SignUpDetailPresentation?
    
    // MARK: - Private properties
    
    private lazy var infoTitleLabel: UILabel = {
       let label = UILabel()
        label.text = L10n.SignUp.infoTitle
        label.textColor = ColorName.textBlack.color
        label.numberOfLines = 1
        label.font = FontFamily.SFProDisplay.regular.font(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameTextField: MainTextField = {
        let textField = MainTextField(style: .regular)
        textField.placeholder = L10n.SignUp.enterName
        textField.textColor = ColorName.darkGray.color
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var surnameTextField: MainTextField = {
        let textField = MainTextField(style: .regular)
        textField.placeholder = L10n.SignUp.enterSurname
        textField.textColor = ColorName.darkGray.color
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var phoneNumberTextField: MainTextField = {
        let textField = MainTextField(style: .phoneNumber)
        textField.placeholder = L10n.SignUp.enterPhoneNumber
        textField.textColor = ColorName.darkGray.color
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: MainTextField = {
        let textField = MainTextField(style: .password)
        textField.placeholder = L10n.SignUp.enterPassword
        textField.textColor = ColorName.darkGray.color
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var confirmPasswordTextField: MainTextField = {
        let textField = MainTextField(style: .password)
        textField.placeholder = L10n.SignUp.enterPasswordAgain
        textField.textColor = ColorName.darkGray.color
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var signUpButton: MainButton = {
        let button = MainButton()
        button.isActive = true
        button.setTitle(L10n.SignUp.register, for: .normal)
        button.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var data: [String: String] = [:]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        title = L10n.SignUp.registration
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubviews(infoTitleLabel,
                         nameTextField,
                         surnameTextField,
                         phoneNumberTextField,
                         passwordTextField,
                         confirmPasswordTextField,
                         signUpButton)
    }
    
    private func configureConstraints() {
        
        infoTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(nameTextField.snp.top).inset(-30)
        }
        
        nameTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.84)
            $0.height.equalTo(50)
            $0.bottom.equalTo(surnameTextField.snp.top).inset(-19)
        }
        
        surnameTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.84)
            $0.height.equalTo(50)
            $0.bottom.equalTo(phoneNumberTextField.snp.top).inset(-19)
        }
        
        phoneNumberTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.84)
            $0.bottom.equalTo(passwordTextField.snp.top).offset(-19)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-50)
            $0.width.equalToSuperview().multipliedBy(0.84)
            $0.height.equalTo(50)
        }
        
        confirmPasswordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(19)
            $0.height.equalTo(50)
            $0.width.equalToSuperview().multipliedBy(0.84)
        }

        signUpButton.snp.makeConstraints {
            $0.top.equalTo(confirmPasswordTextField.snp.bottom).offset(19)
            $0.leading.trailing.equalToSuperview().inset(37)
            $0.width.equalToSuperview().multipliedBy(0.84)
            $0.height.equalTo(50)
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    @objc private func didTapSignUp() {
        guard let name = nameTextField.text,
            let surname = surnameTextField.text,
            let phone = phoneNumberTextField.text?.toPhoneNumber(),
            let password = passwordTextField.text,
            let confirmPassword = confirmPasswordTextField.text
            else {
                return
        }
        nameTextField.resignFirstResponder()
        surnameTextField.resignFirstResponder()
        phoneNumberTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        confirmPasswordTextField.resignFirstResponder()
        presenter?.didTapSignUp(name: name, surname: surname, phone: phone, password: password, passwordConfirm: confirmPassword)
    }
}
extension SignUpDetailViewController: SignUpDetailView {
    func showActivityIndicator() {
        signUpButton.showActivityIndicator()
    }
    func hideActivityIndicator() {
        signUpButton.hideActivityIndicator()
    }

}

// MARK: - Nested types

private extension SignUpDetailViewController {
    
    enum Constants {
    }
    
}
