//
//  AuthenticationStore.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import Foundation

struct AuthenticationStore {
    static let shared = AuthenticationStore()
    
    private init() {}
    
    private let storage = KeyChainStorageImpl()
    
    func store(accessToken: String) {
        storage.set(accessToken, for: AppConstants.KeyChain.Key.accessToken)
    }
    
    func getAccessToken() -> String? {
        return storage.get(for: AppConstants.KeyChain.Key.accessToken)
    }
    
    func removeAccessToken() {
        storage.remove(for: AppConstants.KeyChain.Key.accessToken)
    }
    
    func clear() {
        storage.clear()
    }
}
