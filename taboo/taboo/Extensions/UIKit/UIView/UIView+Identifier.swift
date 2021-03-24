//
//  UIView+Identifier.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//

import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}
