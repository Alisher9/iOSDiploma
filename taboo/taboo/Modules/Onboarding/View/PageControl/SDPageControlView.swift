//
//  SDPageControlView.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import UIKit

final class SDPageControlView: UIView {
    
    // MARK: - Public properties
    
    var selectedPage: Int = 0 {
        didSet {
            guard selectedPage >= 0, selectedPage < dots.count, !dots[selectedPage].isSelected else {
                return
            }
            dots.forEach {
                $0.isSelected = false
            }
            dots[selectedPage].isSelected = true
        }
    }
    
    // MARK: - Private properties
    
    private let numberOfPages: Int
    
    private var dots: [SDPageControlDotView] = []
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .center
        view.spacing = 14.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    init(numberOfPages: Int) {
        self.numberOfPages = numberOfPages
        super.init(frame: .zero)
        setupView()
        configureSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        
        for _ in 0..<numberOfPages {
            dots.append(SDPageControlDotView())
        }
        
        dots.forEach {
            stackView.addArrangedSubview($0)
        }
        
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubview(stackView)
    }
    
    private func configureConstraints() {
        stackView.snp.makeConstraints {
            $0.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
}
