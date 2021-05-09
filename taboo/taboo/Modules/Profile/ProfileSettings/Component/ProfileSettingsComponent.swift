//
//  ProfileSettingsComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

import NeedleFoundation
import UIKit

protocol ProfileSettingsDependency: Dependency {
    var webService: WebServiceType { get }
    var profileResetPasswordModuleBuilder: ProfileResetPasswordModuleBuilder { get }
    var sessionTracker: SessionTracker { get }
}

final class ProfileSettingsComponent: Component<ProfileSettingsDependency> {
}

extension ProfileSettingsComponent: ProfileSettingsModuleBuilder {
    var viewController: UIViewController {
        let viewController = ProfileSettingsViewController()
        let presenter = ProfileSettingsPresenter()
        let router = ProfileSettingsRouter(profileResetPasswordModuleBuilder:
                                            dependency.profileResetPasswordModuleBuilder)
        let interactor = ProfileSettingsInteractor(webService: dependency.webService)
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        presenter.sessionTracker = dependency.sessionTracker
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

protocol ProfileSettingsModuleBuilder {
    var viewController: UIViewController { get }
}
