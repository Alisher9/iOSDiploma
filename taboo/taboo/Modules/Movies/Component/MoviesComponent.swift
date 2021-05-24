//
//  MoviesComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/17/21.
//  
//

import NeedleFoundation
import UIKit

protocol MoviesDependency: Dependency {
    var webService: WebServiceType { get }
}

final class MoviesComponent: Component<MoviesDependency> {
    
    private var movieCardComponent: MovieCardComponent {
        return MovieCardComponent(parent: self)
    }
    
    // MARK: - Properties
    
    var movieContainer: MovieContainer {
        return shared { MovieContainerImpl() }
    }
}

extension MoviesComponent: MoviesModuleBuilder {
    var viewController: UIViewController {
        let viewController = MoviesViewController()
        let presenter = MoviesPresenter()
        let router = MoviesRouter(movieCardModuleBuilder: movieCardComponent)
        let interactor = MoviesInteractor(webService: dependency.webService)
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

protocol MoviesModuleBuilder {
    var viewController: UIViewController { get }
}
