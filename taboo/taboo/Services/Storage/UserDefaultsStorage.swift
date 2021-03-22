//
//  UserDefaultsStorage.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import Foundation

struct UserDefaultsStorage: StorageProtocol {
    
    private let userDefaults = UserDefaults.standard
    
    func integer(for key: Key) -> Int {
        return userDefaults.integer(forKey: key)
    }
    
    func bool(for key: Key) -> Bool {
        return userDefaults.bool(forKey: key)
    }
    
    func object<T>(type: T.Type, for key: Key) -> T? where T : Decodable, T : Encodable {
        guard let data = userDefaults.data(forKey: key) else {
            return nil
        }
        let decoder = JSONDecoder()
        let decodedObject = try? decoder.decode(type, from: data)
        return decodedObject
    }
    
    func set(_ newValue: Bool, for key: Key) {
        userDefaults.setValue(newValue, forKey: key)
    }
    
    func set(_ newValue: Int, for key: Key) {
        userDefaults.setValue(newValue, forKey: key)
    }
    
    func set<T>(_ newValue: T?, for key: Key) where T : Decodable, T : Encodable {
        let encoder = JSONEncoder()
        do {
            let encodedObject = try? encoder.encode(newValue)
            userDefaults.set(encodedObject, forKey: key)
        } catch let error {
            assertionFailure(error.localizedDescription)
        }
    }
    
}
