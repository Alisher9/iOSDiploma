//
//  SessionTrackerImpl.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import UIKit

final class SessionTrackerImpl {
    
    private let storage: StorageProtocol
    private let rootModuleBuilder: RootModuleBuilder
    
    static var aa = 0
    static var id = ""
    let const = !(AuthenticationStore.shared.getAccessToken() == nil)
    
    init(storage: StorageProtocol, rootModuleBuilder: RootModuleBuilder) {
        self.storage = storage
        self.rootModuleBuilder = rootModuleBuilder
        setupObserving()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupObserving() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(logOut),
                                               name: AppConstants.NotificationKey.didLogOut,
                                               object: nil)
    }
    
}

extension SessionTrackerImpl: SessionTracker {
    
    var isLoggedIn: Bool {
        return (SessionTrackerImpl.aa == 1) ? true : const
    }
    
    var isFirstLaunch: Bool {
        get {
            !storage.bool(for: AppConstants.SessionTracker.Key.launchedBefore)
        }
        set {
            storage.set(!newValue, for: AppConstants.SessionTracker.Key.launchedBefore)
        }
    }
    
    func didLogIn(token: String) {
        AuthenticationStore.shared.store(accessToken: token)
        rootModuleBuilder.setupRootController(animated: true)
    }
    
    func didLogWithGenres() {
        rootModuleBuilder.setupRootController(animated: true)
    }
    
    @objc func logOut() {
        AuthenticationStore.shared.removeAccessToken()
        rootModuleBuilder.setupRootController(animated: true)
    }
    
}

