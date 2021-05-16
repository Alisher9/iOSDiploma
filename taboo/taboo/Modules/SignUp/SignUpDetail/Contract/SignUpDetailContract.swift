//
//  SignUpDetailContract.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/15/21.
//  
//

protocol SignUpDetailView: ResultHandlingView {
}

protocol SignUpDetailPresentation: class {
    func didTapSignUp(name: String, surname: String, phone: String, password: String, passwordConfirm: String)
}

protocol SignUpDetailUseCase: class {
    func createUser(name: String, surname: String, phone: String, password: String, passwordConfirm: String)
}

protocol SignUpDetailInteractorOutput: InteractorOutputProtocol {
    func userCreated()
}

protocol SignUpDetailWireframe: class {
    func popToRoot()
}
