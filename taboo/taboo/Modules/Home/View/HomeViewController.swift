//
//  HomeViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var presenter: HomePresentation?
    
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

extension HomeViewController: HomeView {
}

// MARK: - Nested types

private extension HomeViewController {
    
    enum Constants {
    }
    
}
