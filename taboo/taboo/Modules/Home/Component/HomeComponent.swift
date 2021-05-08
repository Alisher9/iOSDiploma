//
//  HomeComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

import NeedleFoundation
import UIKit

protocol HomeDependency: Dependency {
    var webService: WebServiceType { get }
}

final class HomeComponent: Component<HomeDependency> {
}

extension HomeComponent: HomeModuleBuilder {
    var viewController: UIViewController {
        let viewController = HomeViewController()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let interactor = HomeInteractor(webService: dependency.webService)
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

protocol HomeModuleBuilder {
    var viewController: UIViewController { get }
}
