//
//  SignUpComponent.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//  
//

import NeedleFoundation
import UIKit

protocol SignUpDependency: Dependency {
    var webService: WebServiceType { get }
}

final class SignUpComponent: Component<SignUpDependency> {
    
    private var signUpDetailComponent: SignUpDetailComponent {
        return SignUpDetailComponent(parent: self)
    }
    
    var userContainer: UserContainer {
        return shared { SignUpContainer() }
    }
}

extension SignUpComponent: SignUpModuleBuilder {
    var viewController: UIViewController {
        return signUpDetailComponent.viewController
    }
}

protocol SignUpModuleBuilder {
    var viewController: UIViewController { get }
}
