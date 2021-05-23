//
//  LoginPresenter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/23/21.
//  
//

final class LoginPresenter {
    
    // MARK: Properties
    
    weak var view: LoginView?
    var router: LoginWireframe?
    var interactor: LoginUseCase?
    var sessionTracker: SessionTracker?
}

extension LoginPresenter: LoginPresentation {
    func didTapLogin(phoneNumber: String, password: String) {
//        view?.showActivityIndicator()
//        interactor?.login(phoneNumber: phoneNumber, password: password)
        router?.goToGenrePicker()
    }
    
    func didTapSignUp() {
        router?.goToSignUp()
    }
    
}

extension LoginPresenter: LoginInteractorOutput {
    func didLogin(token: String) {
        view?.hideActivityIndicator()
        router?.goToGenrePicker()
        self.sessionTracker?.didLogIn(token: token)
    }
    
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
