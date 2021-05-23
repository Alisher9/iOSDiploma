//
//  SignUpDetailPresenter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/15/21.
//  
//

final class SignUpDetailPresenter {
    
    // MARK: Properties
    
    weak var view: SignUpDetailView?
    var router: SignUpDetailWireframe?
    var interactor: SignUpDetailUseCase?
    var userContainer: UserContainer?
}

extension SignUpDetailPresenter: SignUpDetailPresentation {

    func didTapSignUp(name: String, surname: String, phone: String, password: String, passwordConfirm: String) {
        view?.showActivityIndicator()
        interactor?.createUser(name: name, surname: surname, phone: phone, password: password, passwordConfirm: passwordConfirm)
    }
}

extension SignUpDetailPresenter: SignUpDetailInteractorOutput {
    
    func userCreated() {
        view?.hideActivityIndicator()
        view?.showSuccess(message: "Поздравляем, Вы зарегистрированы в программе.") { [weak self] in
            self?.router?.popToRoot()
        }
    }
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
