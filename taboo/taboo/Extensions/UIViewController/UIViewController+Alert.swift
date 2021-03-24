//
//  UIViewController+Alert.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String? = nil, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

//    func showResult(success: Bool, message: String? = nil, completion: (() -> Void)? = nil) {
//        let resultVC = ResultViewController()
//        resultVC.isSuccess = success
//        resultVC.detailText = message
//        resultVC.completion = completion
//        resultVC.modalPresentationStyle = .overFullScreen
//        present(resultVC, animated: false, completion: nil)
//    }
    
}

