//
//  SignUpPresenter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//  
//

final class SignUpPresenter {
    
    // MARK: Properties
    
    weak var view: SignUpView?
    var router: SignUpWireframe?
    var interactor: SignUpUseCase?
    var userContainer: UserContainer?
}

extension SignUpPresenter: SignUpPresentation {
    func updateUser(with data: [String : String]) {
        userContainer?.user.name = data[JSONRequestParameter.User.name]
        userContainer?.user.surname = data[JSONRequestParameter.User.surname]
        userContainer?.user.phoneNumber = data[JSONRequestParameter.User.phoneNumber]
        userContainer?.user.password = data[JSONRequestParameter.User.password]
        userContainer?.user.passwordConfirmation = data[JSONRequestParameter.User.passwordConfirmation]
    }
    
    func didTapContinue() {
        guard let user = userContainer?.user else {
            return
        }
        view?.showActivityIndicator()
        interactor?.createUser(user: user)
    }
    
//    func viewDidLoad() {
//        var data: [String: String] = [:]
//        data[JSONRequestParameter.User.name] = userContainer?.user.name
//        data[JSONRequestParameter.User.surname] = userContainer?.user.surname
//        data[JSONRequestParameter.User.phoneNumber] = userContainer?.user.phoneNumber
//        data[JSONRequestParameter.User.password] = userContainer?.user.password
//        data[JSONRequestParameter.User.passwordConfirmation] = userContainer?.user.passwordConfirmation
//        view?.update(with: data)
//    }
}

extension SignUpPresenter: SignUpInteractorOutput {
    
    func userCreated() {
        view?.hideActivityIndicator()
        view?.showSuccess(message: "Поздравляем, ваш адрес зарегестрирован в программе.") { [weak self] in
            self?.router?.popToRoot()
        }
    }
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
