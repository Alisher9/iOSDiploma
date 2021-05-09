//
//  GenresComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/9/21.
//  
//

import NeedleFoundation
import UIKit

protocol GenresDependency: Dependency {
    var webService: WebServiceType { get }
}

final class GenresComponent: Component<GenresDependency> {
}

extension GenresComponent: GenresModuleBuilder {
    var viewController: UIViewController {
        let viewController = GenresViewController()
        let presenter = GenresPresenter()
        let router = GenresRouter()
        let interactor = GenresInteractor(webService: dependency.webService)
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

protocol GenresModuleBuilder {
    var viewController: UIViewController { get }
}
