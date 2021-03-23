//
//  RootComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import NeedleFoundation
import UIKit
import Moya

final class RootComponent: BootstrapComponent {
    
    // MARK: - Components
    
    private var onboardingComponent: OnboardingComponent {
        return OnboardingComponent(parent: self)
    }
    
    // MARK: - Properties
    
    var webService: WebServiceType {
        let provider = MoyaProvider<AnyTarget>()
        return WebService(provider: provider)
    }
    
    var sessionTracker: SessionTracker {
        return shared { SessionTrackerImpl(storage: UserDefaultsStorage(), rootModuleBuilder: self) }
    }
    
    var rootModuleBuilder: RootModuleBuilder {
        return self
    }
    
    // MARK: - Private actions
    
    private func setupTabBarController() -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        vc.tabBarItem.title = "Главная"
//        vc.tabBarItem.image = Asset.Tabbar.tabbarMessages.image
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .blue
        vc2.tabBarItem.title = "Жанры"
//        vc2.tabBarItem.image = Asset.Tabbar.tabbarMessages.image
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .blue
        vc3.tabBarItem.title = "Избранное"
//        vc3.tabBarItem.image = Asset.Tabbar.tabbarMessages.image
        
        let vc4 = UIViewController()
        vc4.view.backgroundColor = .blue
        vc4.tabBarItem.title = "Аккаунт"
//        vc4.tabBarItem.image = Asset.Tabbar.tabbarMessages.image
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [vc, vc2, vc3, vc4]
//        tabBarController.tabBar.tintColor = ColorName.mainGreen.color
        
        return tabBarController
    }
}

extension RootComponent: RootModuleBuilder {
    
    var rootViewController: UIViewController {
        let isFirstLaunch = sessionTracker.isFirstLaunch
        let isLoggedIn = sessionTracker.isLoggedIn
        if isFirstLaunch {
//            return onboardinngComponent.viewController
        }
        if isLoggedIn {
            let tabBarVC = setupTabBarController()
            return tabBarVC
        } else {
//            let navigationController = UINavigationController(rootViewController: loginComponent.viewController)
//            navigationController.navigationBar.prefersLargeTitles = true
//            return navigationController
            return UIViewController()
        }
    }
    
    func setupRootController(animated: Bool) {
        guard let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window else {
            return
        }
        
        let rootController = rootViewController
        
        let transition: () -> Void = {
            window.rootViewController = rootController
        }
        
        if let previousViewController = window.rootViewController, animated {
            UIView.transition(with: window,
                              duration: 0.5,
                              options: [.beginFromCurrentState, .transitionFlipFromRight],
                              animations: transition)
            previousViewController.dismiss(animated: false) {
                previousViewController.view.removeFromSuperview()
            }
        } else {
            transition()
        }
    }
}

protocol RootModuleBuilder {
    func setupRootController(animated: Bool)
}