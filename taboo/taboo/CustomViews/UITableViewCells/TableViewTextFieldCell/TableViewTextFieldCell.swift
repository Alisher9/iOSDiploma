//
//  TableViewTextFieldCell.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/15/21.
//

import UIKit

enum TextFieldFontStyle {
    static let regular = FontFamily.SFProDisplay.regular.font(size: 16)
    static let bold = FontFamily.SFProDisplay.bold.font(size: 16)
}

final class TableViewTextFieldCell: UITableViewCell {
    
    // MARK: - Public actions
    
    var textFieldChangeAction: ((_ key: String, _ value: String) -> Void)?
    
    var textfieldText: String? {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }
    
    // MARK: - Private properties
    
    private lazy var textFieldTitleLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    private lazy var textField: MainTextField = {
        let textField = MainTextField(style: .regular)
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private var key: String?
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupCell() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        contentView.addSubviews(textFieldTitleLabel,
                                textField)
    }
    
    private func configureConstraints() {
        textFieldTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(30)
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(textFieldTitleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    
    // MARK: - Public actions
    
    func configure(style: MainTextFieldStyle,
                   placeholder: String,
                   key: String,
                   editable: Bool,
                   fontStyle: UIFont,
                   textColor: UIColor) {
        textField.placeholder = placeholder
        textField.style = style
        textField.isUserInteractionEnabled = editable
        textFieldTitleLabel.font = fontStyle
        textFieldTitleLabel.textColor = textColor
        self.key = key
    }
    
    // MARK: - Private actions
    
    @objc private func textFieldDidChange() {
        guard let key = key, let value = textField.text else {
            return
        }
        textFieldChangeAction?(key, value)
    }
    
}
