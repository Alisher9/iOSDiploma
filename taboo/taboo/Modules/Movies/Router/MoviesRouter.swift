//
//  MoviesRouter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/17/21.
//  
//

import UIKit

final class MoviesRouter {
    
    // MARK: Properties
    
    weak var view: UIViewController?
    private let movieCardModuleBuilder: MovieCardModuleBuilder
    
    init(movieCardModuleBuilder: MovieCardModuleBuilder) {
        self.movieCardModuleBuilder = movieCardModuleBuilder
    }
}

extension MoviesRouter: MoviesWireframe {
    func showMovieCard() {
        let cardVC = movieCardModuleBuilder.viewController
        view?.navigationController?.pushViewController(cardVC, animated: true)
    }
    
}
