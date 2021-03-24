//
//  SignUpViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//  
//

import UIKit

final class SignUpViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var presenter: SignUpPresentation?
    
    // MARK: - Private properties
    
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
        
    }
    
    private func configureConstraints() {
        
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
}

// MARK: - Extensions

extension SignUpViewController: SignUpView {
}

// MARK: - Nested types

private extension SignUpViewController {
    
    enum Constants {
    }
    
}
