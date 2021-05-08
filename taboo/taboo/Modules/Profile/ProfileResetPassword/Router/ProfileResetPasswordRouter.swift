//
//  ProfileResetPasswordRouter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

import UIKit

final class ProfileResetPasswordRouter {
    
    // MARK: Properties
    
    weak var view: UIViewController?
}

extension ProfileResetPasswordRouter: ProfileResetPasswordWireframe {
    func popToRoot() {
        view?.navigationController?.popToRootViewController(animated: true)
    }
}
