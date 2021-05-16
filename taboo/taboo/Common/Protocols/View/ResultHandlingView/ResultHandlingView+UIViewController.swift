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
        showResult(success: true, message: message, completion: completion)
    }
    
    func showNetworkError() {
        hideActivityIndicator()
    }
    
    func showError(message: String?, completion: (() -> Void)?) {
        hideActivityIndicator()
        showError(message: message, completion: completion)
    }
    
    func hideNoNetwork() {
        hideActivityIndicator()
    }
}
