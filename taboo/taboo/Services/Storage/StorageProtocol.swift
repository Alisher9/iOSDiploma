//
//  StorageProtocol.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

typealias Key = String

protocol StorageProtocol {
    func integer(for key: Key) -> Int
    func bool(for key: Key) -> Bool
    func object<T: Codable>(type: T.Type, for key: Key) -> T?
    func set(_ newValue: Bool, for key: Key)
    func set(_ newValue: Int, for key: Key)
    func set<T: Codable>(_ newValue: T?, for key: Key)
}
