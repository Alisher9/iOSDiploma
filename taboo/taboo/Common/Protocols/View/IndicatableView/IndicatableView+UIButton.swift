//
//  IndicatableView+UIButton.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//

import UIKit

extension IndicatableView where Self: UIButton {
    
    var isLoading: Bool {
        return _indicatorView != nil
    }
    
    private var _indicatorView: UIView? {
        for case let indicator as SpinnerView in subviews {
            return indicator
        }
        return nil
    }
    
    func showActivityIndicator() {
        toggleActivityIndicator(show: true)
    }
    
    func hideActivityIndicator() {
        toggleActivityIndicator(show: false)
    }
    
    private func toggleActivityIndicator(show: Bool) {
        if show {
            guard _indicatorView == nil else {
                return
            }
            let indicator = SpinnerView()
            indicator.translatesAutoresizingMaskIntoConstraints = false
            addSubview(indicator)
            NSLayoutConstraint.activate([
                indicator.leadingAnchor.constraint(equalTo: leadingAnchor),
                indicator.topAnchor.constraint(equalTo: topAnchor),
                indicator.trailingAnchor.constraint(equalTo: trailingAnchor),
                indicator.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
            indicator.layer.opacity = 0.0
            UIView.animate(withDuration: 0.5) {
                self.titleLabel?.layer.opacity = 0.0
                indicator.layer.opacity = 1.0
            }
        } else {
            guard let indicator = _indicatorView  else {
                return
            }
            indicator.removeFromSuperview()
            UIView.animate(withDuration: 0.5) {
                self.titleLabel?.layer.opacity = 1.0
            }
        }
    }
}
