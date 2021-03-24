//
//  IndicatableView+UIView.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//

import UIKit

extension IndicatableView where Self: UIView {
    
    var isLoading: Bool {
        return _activityView != nil
    }
    
    private var _activityView: UIView? {
        for case let activityView as ActivityView in subviews {
            return activityView
        }
        return nil
    }
    
    func showActivityIndicator() {
        guard _activityView == nil else {
            return
        }
        let activityView = ActivityView()
        activityView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityView)
        NSLayoutConstraint.activate([
            activityView.leadingAnchor.constraint(equalTo: leadingAnchor),
            activityView.topAnchor.constraint(equalTo: topAnchor),
            activityView.trailingAnchor.constraint(equalTo: trailingAnchor),
            activityView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func hideActivityIndicator() {
        guard let activityView = _activityView  else {
          return
        }
        activityView.removeFromSuperview()
    }
}
