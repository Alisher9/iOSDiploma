//
//  MainButton.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import UIKit

final class MainButton: UIButton, IndicatableView {
    
    // MARK: - Public properties
    
    var isActive: Bool = false {
        didSet {
            setActive(isActive)
        }
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupView() {
        layer.cornerRadius = 25
        titleLabel?.font = FontFamily.SFProDisplay.regular.font(size: 16)
    }
    
    // MARK: - Private actions
    
    private func setActive(_ active: Bool) {
        isEnabled = active
        if active {
            backgroundColor = ColorName.mainPurple.color
            setTitleColor(.white, for: .normal)
        } else {
            backgroundColor = ColorName.lightGray.color
            setTitleColor(ColorName.darkGray.color, for: .normal)
        }
    }
}
