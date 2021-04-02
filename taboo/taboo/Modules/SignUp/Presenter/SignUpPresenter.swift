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
}

extension SignUpPresenter: SignUpPresentation {
}

extension SignUpPresenter: SignUpInteractorOutput {
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
