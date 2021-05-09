//
//  ProfileSettingsRouter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

import UIKit

final class ProfileSettingsRouter {
    
    // MARK: Properties
    
    weak var view: UIViewController?
    
    private let profileResetPasswordModuleBuilder: ProfileResetPasswordModuleBuilder
    
    init(profileResetPasswordModuleBuilder: ProfileResetPasswordModuleBuilder) {
        self.profileResetPasswordModuleBuilder = profileResetPasswordModuleBuilder
    }
}

extension ProfileSettingsRouter: ProfileSettingsWireframe {
    func showResetPasswordPage() {
        let resetPasswordVC = profileResetPasswordModuleBuilder.viewController
        view?.navigationController?.pushViewController(resetPasswordVC, animated: true)
    }
    
    func showLoginPage() {
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        view?.present(vc, animated: true)
    }
}
