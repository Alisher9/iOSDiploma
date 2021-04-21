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
        let storyboard = UIStoryboard(name: "Magnetic", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "magnetic") as? GenrePickerViewController
        vc?.modalPresentationStyle = .fullScreen
        let presenter = GenrePickerPresenter()
        let router = GenrePickerRouter()
        let interactor = GenrePickerInteractor()
        
        vc?.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        router.view = vc
        router.rootModuleBuilder = RootComponent()
        
        interactor.output = presenter
        
        view?.present(vc ?? UIViewController(), animated: true, completion: nil)
    }
}
