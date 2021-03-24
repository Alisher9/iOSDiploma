//
//  HideableTextField.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//

import UIKit

class HideableTextField: UITextField {
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAccessoryInput()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private actions
    
    private func setupAccessoryInput() {
        let toolbar = UIToolbar(frame: CGRect.init(x: 0.0,
                                                   y: 0.0,
                                                   width: self.frame.width,
                                                   height: 44.0))
        let dismissButton = UIBarButtonItem(title: "L10.Common.done",
                                            style: .plain,
                                            target: self,
                                            action: #selector(hideKeyboard))
        
//        dismissButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: ColorName.mainPurple],
//                                             for: .normal)
//        dismissButton.tintColor = ColorName.mainPurple.color
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                        target: self,
                                        action: nil)
        toolbar.items = [flexSpace, dismissButton]
        
        let tapGestureRecognizer = UIGestureRecognizer(target: self, action: #selector(hideKeyboard))
        toolbar.addGestureRecognizer(tapGestureRecognizer)
        
        self.inputAccessoryView = toolbar
    }
    
    @objc private func hideKeyboard() {
        self.resignFirstResponder()
    }
    
}
