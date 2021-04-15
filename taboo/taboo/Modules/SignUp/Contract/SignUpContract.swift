//
//  SignUpContract.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//  
//

protocol SignUpView: ResultHandlingView {
    func update(with data: [String: String])
}

protocol SignUpPresentation: class {
    func didTapContinue()
    func updateUser(with data: [String: String])
}

protocol SignUpUseCase: class {
    func createUser(user: User)
}

protocol SignUpInteractorOutput: InteractorOutputProtocol {
    func userCreated()
}

protocol SignUpWireframe: class {
    func popToRoot()
}
