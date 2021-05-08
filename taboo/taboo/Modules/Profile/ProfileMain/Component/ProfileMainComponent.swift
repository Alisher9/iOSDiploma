//
//  ProfileMainComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

import NeedleFoundation
import UIKit

protocol ProfileMainDependency: Dependency {
    var webService: WebServiceType { get }
    var profileSettingsModuleBuilder: ProfileSettingsModuleBuilder { get }
    var sessionTracker: SessionTracker { get }
}

final class ProfileMainComponent: Component<ProfileMainDependency> {
}

extension ProfileMainComponent: ProfileMainModuleBuilder {
    var viewController: UIViewController {
        let viewController = ProfileMainViewController()
        let presenter = ProfileMainPresenter()
        let router = ProfileMainRouter(profileSettingsModuleBuilder: dependency.profileSettingsModuleBuilder)
        let interactor = ProfileMainInteractor(webService: dependency.webService)
        
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

protocol ProfileMainModuleBuilder {
    var viewController: UIViewController { get }
}
