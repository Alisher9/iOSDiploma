//
//  ProfileResetPasswordPresenter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

final class ProfileResetPasswordPresenter {
    
    // MARK: Properties
    
    weak var view: ProfileResetPasswordView?
    var router: ProfileResetPasswordWireframe?
    var interactor: ProfileResetPasswordUseCase?
}

extension ProfileResetPasswordPresenter: ProfileResetPasswordPresentation {
    func didTapReset() {
        view?.showSuccess(message: "Вы поменяли пароль") { [weak self] in
            self?.router?.popToRoot()
        }
    }
}

extension ProfileResetPasswordPresenter: ProfileResetPasswordInteractorOutput {
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
