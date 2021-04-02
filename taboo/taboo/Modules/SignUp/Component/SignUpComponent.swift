//
//  SignUpComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//  
//

import NeedleFoundation
import UIKit

protocol SignUpDependency: Dependency {
    var webService: WebServiceType { get }
}

final class SignUpComponent: Component<SignUpDependency> {
}

extension SignUpComponent: SignUpModuleBuilder {
    var viewController: UIViewController {
        let viewController = SignUpViewController()
        let presenter = SignUpPresenter()
        let router = SignUpRouter()
        let interactor = SignUpInteractor(webService: dependency.webService)
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

protocol SignUpModuleBuilder {
    var viewController: UIViewController { get }
}
