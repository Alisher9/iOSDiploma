//
//  GenrePickerComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/16/21.
//  
//

import NeedleFoundation
import UIKit

protocol GenrePickerDependency: Dependency {
    var webService: WebServiceType { get }
}

final class GenrePickerComponent: Component<GenrePickerDependency> {
}

extension GenrePickerComponent: GenrePickerModuleBuilder {
    var viewController: UIViewController {
        let viewController = GenrePickerViewController()
        let presenter = GenrePickerPresenter()
        let router = GenrePickerRouter()
        let interactor = GenrePickerInteractor()
        
        viewController.interactor = interactor
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

protocol GenrePickerModuleBuilder {
    var viewController: UIViewController { get }
}
