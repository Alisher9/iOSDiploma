//
//  SignUpDetailRouter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/15/21.
//  
//

import UIKit

final class SignUpDetailRouter {
    
    // MARK: Properties
    
    weak var view: UIViewController?
}

extension SignUpDetailRouter: SignUpDetailWireframe {
    func popToRoot() {
        view?.navigationController?.popToRootViewController(animated: true)
    }
}

