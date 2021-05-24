//
//  WeatherComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/19/21.
//  
//

import NeedleFoundation
import UIKit

protocol WeatherDependency: Dependency {
    var webService: WebServiceType { get }
}

final class WeatherComponent: Component<WeatherDependency> {
}

extension WeatherComponent: WeatherModuleBuilder {
    var viewController: UIViewController {
        let viewController = WeatherViewController()
        let presenter = WeatherPresenter()
        let router = WeatherRouter()
        let interactor = WeatherInteractor(webService: dependency.webService)
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

protocol WeatherModuleBuilder {
    var viewController: UIViewController { get }
}
