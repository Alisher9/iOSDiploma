//
//  ProfileMainPresenter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

import Foundation

final class ProfileMainPresenter {
    
    // MARK: Properties
    
    weak var view: ProfileMainView?
    var router: ProfileMainWireframe?
    var interactor: ProfileMainUseCase?
    var sessionTracker: SessionTracker?
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension ProfileMainPresenter: ProfileMainPresentation {
    func didTapSettings() {
        router?.showProfileSettings()
    }
}

extension ProfileMainPresenter: ProfileMainInteractorOutput {
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
