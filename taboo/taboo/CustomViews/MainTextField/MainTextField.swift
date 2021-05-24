//
//  MainTextField.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//

import UIKit

final class MainTextField: HideableTextField {
    
    var style: MainTextFieldStyle {
        didSet {
            configure(style)
        }
    }
    
    private lazy var containerViewForIcon: UIView = {
       let view = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 40))
        let iconTappedGesture = UITapGestureRecognizer()
        iconTappedGesture.addTarget(self, action: #selector(textSecureIconTapped))
        view.addGestureRecognizer(iconTappedGesture)
        return view
    }()
    
    private lazy var textSecureIcon: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: -4.0, y: 8.0, width: 22.0, height: 22.0))
        imageView.image = Asset.visibilityOn.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    init(style: MainTextFieldStyle) {
        self.style = style
        super.init(frame: .zero)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupTextField() {
        
        containerViewForIcon.addSubview(textSecureIcon)
        rightViewMode = UITextField.ViewMode.always
        rightView = containerViewForIcon
        
        delegate = self
        layer.borderWidth = 1
        layer.cornerRadius = 25
        layer.borderColor = ColorName.lightGray.color.cgColor
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        
        configure(style)
    }
    
    // MARK: - Private actions
    
    private func configure(_ style: MainTextFieldStyle) {
        switch style {
        case .phoneNumber:
            isSecureTextEntry = false
            placeholder = "+7 ()"
            textSecureIcon.isHidden = true
            textSecureIcon.isUserInteractionEnabled = false
            containerViewForIcon.isUserInteractionEnabled = false
            keyboardType = .asciiCapableNumberPad
        case .number:
            isSecureTextEntry = false
            placeholder = ""
            containerViewForIcon.isUserInteractionEnabled = false
            textSecureIcon.isHidden = true
            textSecureIcon.isUserInteractionEnabled = false
            keyboardType = .numberPad
        case .password:
            isSecureTextEntry = true
            textSecureIcon.isHidden = false
            containerViewForIcon.isUserInteractionEnabled = true
            keyboardType = .asciiCapable
        case .regular:
            isSecureTextEntry = false
            containerViewForIcon.isUserInteractionEnabled = false
            textSecureIcon.isHidden = true
            textSecureIcon.isUserInteractionEnabled = false
            keyboardType = .asciiCapable
        }
    }
    
    private func formatPhoneTextField(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex

        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }

    @objc private func textSecureIconTapped() {
        self.isSecureTextEntry.toggle()
        if textSecureIcon.image == Asset.visibilityOff.image {
            textSecureIcon.image = Asset.visibilityOn.image
        } else {
            textSecureIcon.image = Asset.visibilityOff.image
        }
    }
   
}

extension MainTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let maxLength: Int
        guard let textFieldText = textField.text else {
            return false
        }
        switch style {
        case .phoneNumber:
            let newString = (textFieldText as NSString).replacingCharacters(in: range, with: string)
            textField.text = formatPhoneTextField(with: AppConstants.defaultPhoneNumberFormat, phone: newString)
            return false
        case .number:
            return Int(string) != nil || string.isEmpty
        case .regular:
            return true
        case .password:
            maxLength = 20
            let currentString: NSString = textFieldText as NSString
            let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch style {
        case .phoneNumber:
            if let text = textField.text, text.isEmpty {
                textField.text = "+7"
            }
        case .password, .number, .regular:
            break
        }
        
    }
    
}
