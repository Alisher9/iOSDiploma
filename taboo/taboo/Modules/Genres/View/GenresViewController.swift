//
//  GenresViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/9/21.
//  
//

import UIKit

final class GenresViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var presenter: GenresPresentation?
    
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

extension GenresViewController: GenresView {
}

// MARK: - Nested types

private extension GenresViewController {
    
    enum Constants {
    }
    
}
