//
//  ProfileResetPasswordContract.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

protocol ProfileResetPasswordView: ResultHandlingView {
}

protocol ProfileResetPasswordPresentation: class {
    func didTapReset()
}

protocol ProfileResetPasswordUseCase: class {
}

protocol ProfileResetPasswordInteractorOutput: InteractorOutputProtocol {
}

protocol ProfileResetPasswordWireframe: class {
    func popToRoot()
}
