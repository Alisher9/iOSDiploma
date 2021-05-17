//
//  MovieCardComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/17/21.
//  
//

import NeedleFoundation
import UIKit

protocol MovieCardDependency: Dependency {
    var webService: WebServiceType { get }
    var movieContainer: MovieContainer { get }
    var sessionTracker: SessionTracker { get }
}

final class MovieCardComponent: Component<MovieCardDependency> {
}

extension MovieCardComponent: MovieCardModuleBuilder {
    var viewController: UIViewController {
        let viewController = MovieCardViewController()
        let presenter = MovieCardPresenter()
        let router = MovieCardRouter()
        let interactor = MovieCardInteractor(webService: dependency.webService)
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        presenter.movieContainer = dependency.movieContainer
        presenter.sessionTracker = dependency.sessionTracker
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

protocol MovieCardModuleBuilder {
    var viewController: UIViewController { get }
}
