//
//  UIViewController+TopVC.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//

import UIKit

extension UIViewController {
    
    var topMostViewController: UIViewController? {
        if presentedViewController == nil {
            return self
        }
        
        if let navigation = presentedViewController as? UINavigationController {
            return navigation.visibleViewController?.topMostViewController
        }
        
        if let tab = presentedViewController as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController
            }
            return tab.topMostViewController
        }
        
        return presentedViewController?.topMostViewController
    }
    
    func backToPreviousController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension UIApplication {
    
    var topMostViewController: UIViewController? {
        return keyWindow?.rootViewController?.topMostViewController
    }
    
}

