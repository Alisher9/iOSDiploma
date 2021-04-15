//
//  PhoneNumberInputView.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/15/21.
//

import UIKit
import SnapKit

protocol PhoneNumberInputViewDelegate: class {
    func phoneNumberDidChange(phoneNumber: String)
}

final class PhoneNumberInputView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: PhoneNumberInputViewDelegate?
    
    var phoneNumber: String {
        return "+7"+(phoeNumberTextField.text?.replacingOccurrences(of: " ", with: "") ?? "")
    }
    
    // MARK: - Private properties
    
    private lazy var numberCodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorName.textBlack.color
        label.numberOfLines = 1
        label.text = "+7"
        label.font = FontFamily.SFProDisplay.medium.font(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var phoeNumberTextField: UITextField = {
        let view = UITextField()
        view.textColor = ColorName.textBlack.color
        view.placeholder = L10n.SignUp.phoneNumber
        view.font = FontFamily.SFProDisplay.medium.font(size: 20)
        view.keyboardType = .numberPad
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        layer.cornerRadius = 10
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = ColorName.textBlack.color.cgColor
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubviews(numberCodeLabel, phoeNumberTextField)
    }
    
    private func configureConstraints() {
        numberCodeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(25)
        }
        
        phoeNumberTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(numberCodeLabel.snp.trailing).offset(30)
        }
    }
    
    // MARK: - Public actions
    
    @discardableResult
    override func becomeFirstResponder() -> Bool {
        phoeNumberTextField.becomeFirstResponder()
    }
    
    // MARK: - Private actions
    
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
    
}

extension PhoneNumberInputView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        guard let textFieldText = textField.text else {
            return false
        }
        
        let newString = (textFieldText as NSString).replacingCharacters(in: range, with: string)
        textField.text = formatPhoneTextField(with: "XXX XXX XXXX", phone: newString)
        
        delegate?.phoneNumberDidChange(phoneNumber: phoneNumber)
        
        return false
    }

}
