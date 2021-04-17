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
    private let genrePickerModuleBuilder: GenrePickerModuleBuilder
    
    
    init(signUpModuleBuilder: SignUpModuleBuilder, genrePickerModuleBuilder: GenrePickerModuleBuilder) {
        self.signUpModuleBuilder = signUpModuleBuilder
        self.genrePickerModuleBuilder = genrePickerModuleBuilder
    }
}

extension LoginRouter: LoginWireframe {
    func goToSignUp() {
        let signUpVC = signUpModuleBuilder.viewController
        view?.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    func goToGenrePicker() {
        let genrePickerVC = genrePickerModuleBuilder.viewController
        genrePickerVC.modalPresentationStyle = .fullScreen
        view?.present(genrePickerVC, animated: true)
//        view?.navigationController?.pushViewController(genrePickerVC, animated: true)
        
    }
    
}
