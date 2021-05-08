//
//  ProfileSettingsPresenter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

final class ProfileSettingsPresenter {
    
    // MARK: Properties
    
    weak var view: ProfileSettingsView?
    var router: ProfileSettingsWireframe?
    var interactor: ProfileSettingsUseCase?
    var sessionTracker: SessionTracker?
}

extension ProfileSettingsPresenter: ProfileSettingsPresentation {
    func didSelectResetPassword() {
        router?.showResetPasswordPage()
    }
    func didSelectLogOut() {
//        sessionTracker?.logOut()
        router?.showLoginPage()
    }
}

extension ProfileSettingsPresenter: ProfileSettingsInteractorOutput {
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
