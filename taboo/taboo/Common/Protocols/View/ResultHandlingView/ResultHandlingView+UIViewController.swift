//
//  ResultHandlingView+UIViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import UIKit

extension ResultHandlingView where Self: UIViewController {
    
    func showSuccess(message: String?, completion: (() -> Void)?) {
        hideActivityIndicator()
    }
    
    func showNetworkError() {
        hideActivityIndicator()
    }
    
    func showError(message: String?, completion: (() -> Void)?) {
        hideActivityIndicator()
    }
    
    func hideNoNetwork() {
        hideActivityIndicator()
    }
}
