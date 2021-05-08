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
    
    private var loginComponent: LoginComponent {
        return LoginComponent(parent: self)
    }
    
    private var mainPageComponent: HomeComponent {
        return HomeComponent(parent: self)
    }
    
    private var profileComponent: ProfileComponent {
        return ProfileComponent(parent: self)
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
        let vc = mainPageComponent.viewController
        vc.tabBarItem.title = L10n.Common.home
        vc.tabBarItem.image = Asset.tabbarHome.image
//        let vcNavVc = UINavigationController(rootViewController: vc)
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .red
        vc2.tabBarItem.title = L10n.Common.genre
        vc2.tabBarItem.image = Asset.tabbarGenre.image
        let vc2NavVc = UINavigationController(rootViewController: vc2)
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .yellow
        vc3.tabBarItem.title = L10n.Common.favorite
        vc3.tabBarItem.image = Asset.tabbarFavorite.image
        
        let vc4 = profileComponent.viewController
//        vc4.view.backgroundColor = .green
        vc4.tabBarItem.title = L10n.Common.profile
        vc4.tabBarItem.image = Asset.tabbarProfile.image
        let profileNavVC = UINavigationController(rootViewController: vc4)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [vc, vc2NavVc, vc3, profileNavVC]
        tabBarController.tabBar.tintColor = ColorName.mainPurple.color
        
        return tabBarController
    }
}

extension RootComponent: RootModuleBuilder {
    
    var rootViewController: UIViewController {
        let isFirstLaunch = sessionTracker.isFirstLaunch
        let isLoggedIn = sessionTracker.isLoggedIn
        if isFirstLaunch {
            return onboardingComponent.viewController
        }
        if isLoggedIn {
            let tabBarVC = setupTabBarController()
            return tabBarVC
        } else {
            let navigationController = UINavigationController(rootViewController: loginComponent.viewController)
            navigationController.navigationBar.prefersLargeTitles = true
            return navigationController
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
