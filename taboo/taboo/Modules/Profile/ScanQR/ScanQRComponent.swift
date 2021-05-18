//
//  ScanQRComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/18/21.
//  
//

import NeedleFoundation
import UIKit

protocol ScanQRDependency: Dependency {
    var webService: WebServiceType { get }
}

final class ScanQRComponent: Component<ScanQRDependency> {
}

extension ScanQRComponent: ScanQRModuleBuilder {
    var viewController: UIViewController {
        let viewController = ScanQRViewController()
        let presenter = ScanQRPresenter()
        let router = ScanQRRouter()
        let interactor = ScanQRInteractor(webService: dependency.webService)
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

protocol ScanQRModuleBuilder {
    var viewController: UIViewController { get }
}
