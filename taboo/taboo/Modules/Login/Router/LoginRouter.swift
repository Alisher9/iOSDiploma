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
    private let sessionTracker: SessionTracker
    
    init(signUpModuleBuilder: SignUpModuleBuilder,
         genrePickerModuleBuilder: GenrePickerModuleBuilder,
         sessionTracker: SessionTracker) {
        self.signUpModuleBuilder = signUpModuleBuilder
        self.genrePickerModuleBuilder = genrePickerModuleBuilder
        self.sessionTracker = sessionTracker
    }
}

extension LoginRouter: LoginWireframe {
    func goToSignUp() {
        let signUpVC = signUpModuleBuilder.viewController
        view?.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    func goToGenrePicker() {
        let storyboard = UIStoryboard(name: "Magnetic", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "magnetic") as? GenrePickerViewController
        vc?.modalPresentationStyle = .fullScreen
        let presenter = GenrePickerPresenter()
        let router = GenrePickerRouter()
        let interactor = GenrePickerInteractor()
        
        vc?.presenter = presenter
        interactor.output = presenter
        
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
        presenter.sessionTracker = sessionTracker
        
        router.view = vc
        
        router.rootModuleBuilder = RootComponent()
        
        view?.present(vc ?? UIViewController(), animated: true, completion: nil)
    } 
}
