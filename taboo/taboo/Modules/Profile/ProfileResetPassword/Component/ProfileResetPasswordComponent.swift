//
//  ProfileResetPasswordComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

import NeedleFoundation
import UIKit

protocol ProfileResetPasswordDependency: Dependency {
    var webService: WebServiceType { get }
}

final class ProfileResetPasswordComponent: Component<ProfileResetPasswordDependency> {
}

extension ProfileResetPasswordComponent: ProfileResetPasswordModuleBuilder {
    var viewController: UIViewController {
        let viewController = ProfileResetPasswordViewController()
        let presenter = ProfileResetPasswordPresenter()
        let router = ProfileResetPasswordRouter()
        let interactor = ProfileResetPasswordInteractor(webService: dependency.webService)
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

protocol ProfileResetPasswordModuleBuilder {
    var viewController: UIViewController { get }
}
