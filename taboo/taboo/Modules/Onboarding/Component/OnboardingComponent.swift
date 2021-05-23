//
//  OnboardingComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//  
//

import NeedleFoundation
import UIKit

protocol OnboardingDependency: Dependency {
    var sessionTracker: SessionTracker { get }
    var rootModuleBuilder: RootModuleBuilder { get }
}

final class OnboardingComponent: Component<OnboardingDependency> {
}

extension OnboardingComponent: OnboardingModuleBuilder {
    var viewController: UIViewController {
        let viewController = OnboardingViewController()
        let presenter = OnboardingPresenter()
        let router = OnboardingRouter(rootModuleBuilder: dependency.rootModuleBuilder)
        let interactor = OnboardingInteractor(sessionTracker: dependency.sessionTracker)
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

protocol OnboardingModuleBuilder {
    var viewController: UIViewController { get }
}
