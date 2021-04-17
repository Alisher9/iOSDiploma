//
//  HideableTextField.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//

import UIKit

class HideableTextField: UITextField {
    
    // MARK: - Lifecycle
    
    private lazy var toolbar: UIToolbar = {
        return UIToolbar(frame: CGRect.init(x: 0.0,
                                               y: 0.0,
                                               width: self.frame.width,
                                               height: 44.0))
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAccessoryInput()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private actions
    
    private func setupAccessoryInput() {
        let dismissButton = UIBarButtonItem(title: L10n.Common.done,
                                            style: .plain,
                                            target: self,
                                            action: #selector(hideKeyboard))
        
        dismissButton.tintColor = ColorName.mainPurple.color
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                        target: self,
                                        action: nil)
        toolbar.items = [flexSpace, dismissButton]
        self.inputAccessoryView = toolbar
    }
    
    @objc private func hideKeyboard() {
        self.resignFirstResponder()
    }
    
}
