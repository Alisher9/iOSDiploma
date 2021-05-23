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
    
    private let generateQRModuleBuilder: GenerateQRModuleBuilder
    private let scanQRModuleBuilder: ScanQRModuleBuilder
    private let profileResetPasswordModuleBuilder: ProfileResetPasswordModuleBuilder
    
    init(profileResetPasswordModuleBuilder: ProfileResetPasswordModuleBuilder,
         generateQRModuleBuilder: GenerateQRModuleBuilder,
         scanQRModuleBuilder: ScanQRModuleBuilder) {
        self.generateQRModuleBuilder = generateQRModuleBuilder
        self.scanQRModuleBuilder = scanQRModuleBuilder
        self.profileResetPasswordModuleBuilder = profileResetPasswordModuleBuilder
    }
}

extension ProfileSettingsRouter: ProfileSettingsWireframe {
    func showGenerateQR() {
        let generateQRVC = generateQRModuleBuilder.viewController
        view?.navigationController?.pushViewController(generateQRVC, animated: true)
    }
    
    func showScanQR() {
        let scanQRVC = scanQRModuleBuilder.viewController
        view?.navigationController?.pushViewController(scanQRVC, animated: true)
    }
    
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
