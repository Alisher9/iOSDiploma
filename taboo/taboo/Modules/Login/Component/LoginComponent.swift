//
//  LoginComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/23/21.
//  
//

import NeedleFoundation
import UIKit

protocol LoginDependency: Dependency {
    var webService: WebServiceType { get }
    var sessionTracker: SessionTracker { get }
}

final class LoginComponent: Component<LoginDependency> {
    
    // MARK: - Components
    
    private var signUpComponent: SignUpComponent {
        return SignUpComponent(parent: self)
    }
}

extension LoginComponent: LoginModuleBuilder {
    var viewController: UIViewController {
        let viewController = LoginViewController()
        let presenter = LoginPresenter()
        let router = LoginRouter(signUpModuleBuilder: signUpComponent)
        let interactor = LoginInteractor(webService: dependency.webService)
        
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

protocol LoginModuleBuilder {
    var viewController: UIViewController { get }
}
