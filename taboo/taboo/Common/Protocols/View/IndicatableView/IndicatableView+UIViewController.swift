//
//  IndicatableView+UIViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//

import UIKit

extension IndicatableView where Self: UIViewController {
    
    var isLoading: Bool {
        return _activityView != nil
    }
    
    private var _activityView: UIView? {
        let onView: UIView
        if let navigationController = self.navigationController {
            onView = navigationController.view
        } else {
            onView = self.view
        }
        for case let activityView as ActivityView in onView.subviews {
            return activityView
        }
        return nil
    }
    
    func showActivityIndicator() {
        guard _activityView == nil else {
            return
        }
        
        let onView: UIView
        if let navigationController = self.navigationController {
            onView = navigationController.view
        } else {
            onView = self.view
        }
        let activityView = ActivityView()
        activityView.translatesAutoresizingMaskIntoConstraints = false
        onView.addSubview(activityView)
        NSLayoutConstraint.activate([
            activityView.leadingAnchor.constraint(equalTo: onView.leadingAnchor),
            activityView.topAnchor.constraint(equalTo: onView.topAnchor),
            activityView.trailingAnchor.constraint(equalTo: onView.trailingAnchor),
            activityView.bottomAnchor.constraint(equalTo: onView.bottomAnchor)
        ])
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func hideActivityIndicator() {
        guard let activityView = _activityView  else {
          return
        }
        activityView.removeFromSuperview()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
}

