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
}
