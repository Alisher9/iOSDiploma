//
//  SignUpRouter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//  
//

import UIKit

final class SignUpRouter {
    
    // MARK: Properties
    
    weak var view: UIViewController?
}

extension SignUpRouter: SignUpWireframe {
    func popToRoot() {
        view?.navigationController?.popToRootViewController(animated: true)
    }
}
