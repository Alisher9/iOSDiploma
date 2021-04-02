//
//  UIView+AddSubviews.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        addSubviews(views)
    }
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }
}
