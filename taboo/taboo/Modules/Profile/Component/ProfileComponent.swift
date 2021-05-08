//
//  ProfileComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

import NeedleFoundation
import UIKit

protocol ProfileDependency: Dependency {
    var webService: WebServiceType { get }
}

final class ProfileComponent: Component<ProfileDependency> {
    
    // MARK: - Components
    
    private var profileMainComponent: ProfileMainComponent {
        return ProfileMainComponent(parent: self)
    }
    
    private var profileSettingsComponent: ProfileSettingsComponent {
        return ProfileSettingsComponent(parent: self)
    }
    
    private var profileResetPasswordComponent: ProfileResetPasswordComponent {
        return ProfileResetPasswordComponent(parent: self)
    }
    
    // MARK: - Properties
    
    var profileSettingsModuleBuilder: ProfileSettingsModuleBuilder {
        return profileSettingsComponent
    }
    
    var profileResetPasswordModuleBuilder: ProfileResetPasswordModuleBuilder {
        return profileResetPasswordComponent
    }
}

extension ProfileComponent: ProfileModuleBuilder {
    var viewController: UIViewController {
        return profileMainComponent.viewController
    }
}

protocol ProfileModuleBuilder {
    var viewController: UIViewController { get }
}
