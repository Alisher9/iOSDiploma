//
//  KeyChainStorage.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import Foundation
import KeychainAccess

protocol KeyChainStorage {
    func set(_ value: String, for key: Key)
    func get(for key: Key) -> String?
    func remove(for key: Key)
    func clear()
}

struct KeyChainStorageImpl: KeyChainStorage {
    
    private let keyChain = Keychain(service: AppConstants.KeyChain.Key.domain)
    
    func set(_ value: String, for key: Key) {
        keyChain[key] = value
    }
    
    func get(for key: Key) -> String? {
        return keyChain[key]
    }
    
    func remove(for key: Key) {
        keyChain[key] = nil
    }
    
    func clear() {
        do {
            try keyChain.removeAll()
        } catch let error {
            assertionFailure("Can't clear keychain store: \(error.localizedDescription)")
        }
    }
    
    
}
