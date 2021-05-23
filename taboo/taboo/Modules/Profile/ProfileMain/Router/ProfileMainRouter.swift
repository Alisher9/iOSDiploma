//
//  ProfileMainRouter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

import UIKit

final class ProfileMainRouter {
    
    // MARK: Properties
    
    weak var view: UIViewController?
    
    private let profileSettingsModuleBuilder: ProfileSettingsModuleBuilder
    
    init(profileSettingsModuleBuilder: ProfileSettingsModuleBuilder) {
        self.profileSettingsModuleBuilder = profileSettingsModuleBuilder
    }
    
}

extension ProfileMainRouter: ProfileMainWireframe {
    func showProfileSettings() {
        let vc = profileSettingsModuleBuilder.viewController
        view?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
