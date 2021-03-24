//
//  LoginContract.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/23/21.
//  
//

protocol LoginView: ResultHandlingView {
}

protocol LoginPresentation: class {
    func didTapLogin(phoneNumber: String, password: String)
    func didTapSignUp()
}

protocol LoginUseCase: class {
    func login(phoneNumber: String, password: String)
}

protocol LoginInteractorOutput: InteractorOutputProtocol {
    func didLogin(token: String)
}

protocol LoginWireframe: class {
    func goToSignUp()
}
