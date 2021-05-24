//
//  GenerateQRComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/18/21.
//  
//

import NeedleFoundation
import UIKit

protocol GenerateQRDependency: Dependency {
    var webService: WebServiceType { get }
}

final class GenerateQRComponent: Component<GenerateQRDependency> {
}

extension GenerateQRComponent: GenerateQRModuleBuilder {
    var viewController: UIViewController {
        let viewController = GenerateQRViewController()
        let presenter = GenerateQRPresenter()
        let router = GenerateQRRouter()
        let interactor = GenerateQRInteractor(webService: dependency.webService)
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

protocol GenerateQRModuleBuilder {
    var viewController: UIViewController { get }
}
