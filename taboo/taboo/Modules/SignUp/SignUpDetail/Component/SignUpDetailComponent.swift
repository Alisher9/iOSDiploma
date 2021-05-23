//
//  SignUpDetailComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/15/21.
//  
//

import NeedleFoundation
import UIKit

protocol SignUpDetailDependency: Dependency {
    var webService: WebServiceType { get }
    var userContainer: UserContainer { get }
}

final class SignUpDetailComponent: Component<SignUpDetailDependency> {
}

extension SignUpDetailComponent: SignUpDetailModuleBuilder {
    var viewController: UIViewController {
        let viewController = SignUpDetailViewController()
        let presenter = SignUpDetailPresenter()
        let router = SignUpDetailRouter()
        let interactor = SignUpDetailInteractor(webService: dependency.webService)
        
        viewController.presenter = presenter
        
        presenter.view = viewController 
        presenter.router = router
        presenter.interactor = interactor
        presenter.userContainer = dependency.userContainer
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

protocol SignUpDetailModuleBuilder {
    var viewController: UIViewController { get }
}
