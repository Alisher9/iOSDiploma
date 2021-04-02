//
//  SDPageControlDotView.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import UIKit
import SnapKit

final class SDPageControlDotView: UIView {
    
    // MARK: - Public properties
    
    var isSelected: Bool = false {
        didSet {
            setSelected(isSelected)
        }
    }
    
    // MARK: - Private properties
    
    private let activeColor = UIColor.purple
    private let inactiveColor = UIColor.gray
    
    private lazy var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 4.0
        view.layer.borderWidth = 0.5
        view.layer.borderColor = view.backgroundColor?.cgColor
        view.layer.masksToBounds = true
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
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = false
        snp.makeConstraints {
            $0.width.height.equalTo(8.0)
        }
        layer.cornerRadius = 4.0
        configureSubviews()
        configureConstraints()
        setSelected(false)
    }
    
    private func configureSubviews() {
        addSubview(circleView)
    }
    
    private func configureConstraints() {
        circleView.snp.makeConstraints {
            $0.centerX.centerY.width.height.equalToSuperview()
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
    private func setSelected(_ selected: Bool) {
        UIView.animate(withDuration: 0.7,
                       delay: 0.0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.8,
                       options: .curveEaseOut,
                       animations: {
                        let transform = selected ? CGAffineTransform(scaleX: 2.25, y: 2.25) : CGAffineTransform.identity
                        self.circleView.transform = transform
        }, completion: nil)
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = selected ? self.activeColor : self.inactiveColor
            let circleColor = selected ? self.activeColor.cgColor : self.inactiveColor.cgColor
            self.circleView.layer.borderColor = circleColor
        }
    }
    
}
