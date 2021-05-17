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
    func viewDidLoad() {
//        view?.showActivityIndicator()
//        if let user = sessionTracker?.currentUser {
//            view?.hideActivityIndicator()
//            view?.update(with: user)
//        }
        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(updateUser(_:)),
//                                               name: AppConstants.NotificationKey.userUpdated,
//                                               object: nil)
    }
    
    func didTapSettings() {
        router?.showProfileSettings()
    }
}

extension ProfileMainPresenter: ProfileMainInteractorOutput {
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
