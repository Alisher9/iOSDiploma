//
//  IndicatableView+UITableView.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//

import UIKit
import SnapKit

extension IndicatableView where Self: UITableView {
    
    var isLoading: Bool {
        return _activityView != nil
    }
    
    private var _activityView: UIView? {
        for case let activityView as TableViewIndicatorView in subviews {
            return activityView
        }
        return nil
    }
    
    func showActivityIndicator() {
        guard _activityView == nil else {
            return
        }
        let activityView = TableViewIndicatorView()
        activityView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityView)
        activityView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.size.equalToSuperview()
        }
        activityView.transform = CGAffineTransform(translationX: 0, y: contentInset.top)
    }
    
    func hideActivityIndicator() {
        guard let activityView = _activityView  else {
          return
        }
        activityView.removeFromSuperview()
    }
}

extension UITableView: IndicatableView {}

