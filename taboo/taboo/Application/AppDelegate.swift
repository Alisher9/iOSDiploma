//
//  AppDelegate.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        registerProviderFactories()
        window = UIWindow()
        let rootComponent = RootComponent()
        
        // ----- To test login and onboarding
        rootComponent.sessionTracker.isFirstLaunch = false
//        AuthenticationStore.shared.removeAccessToken()
        // -----
        
        rootComponent.setupRootController(animated: false)
        window?.makeKeyAndVisible()
        return true
    }
}

