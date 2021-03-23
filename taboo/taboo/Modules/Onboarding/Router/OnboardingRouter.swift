//
//  OnboardingRouter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//  
//

import UIKit

final class OnboardingRouter {
    
    // MARK: Properties
    
    weak var view: UIViewController?
    
    var rootModuleBuilder: RootModuleBuilder
    
    init(rootModuleBuilder: RootModuleBuilder) {
        self.rootModuleBuilder = rootModuleBuilder
    }
}

extension OnboardingRouter: OnboardingWireframe {
    func finishOnboarding() {
        rootModuleBuilder.setupRootController(animated: true)
    }
}
