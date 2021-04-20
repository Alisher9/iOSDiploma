//
//  GenrePickerRouter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/16/21.
//  
//

import UIKit

final class GenrePickerRouter {
    
    // MARK: Properties
    
    weak var view: UIViewController?
    var rootModuleBuilder: RootModuleBuilder?
}

extension GenrePickerRouter: GenrePickerWireframe {
    func goToMainTabBar() {
        rootModuleBuilder?.setupRootController(animated: true)
    }
    
}
