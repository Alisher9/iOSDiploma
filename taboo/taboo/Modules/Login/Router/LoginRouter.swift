//
//  LoginRouter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/23/21.
//  
//

import UIKit

final class LoginRouter {
    
    // MARK: Properties
    
    weak var view: UIViewController?
    private let signUpModuleBuilder: SignUpModuleBuilder
    
    init(signUpModuleBuilder: SignUpModuleBuilder) {
        self.signUpModuleBuilder = signUpModuleBuilder
    }
}

extension LoginRouter: LoginWireframe {
    func goToSignUp() {
        let signUpVC = signUpModuleBuilder.viewController
        view?.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
}
