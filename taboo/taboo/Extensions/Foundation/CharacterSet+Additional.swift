//
//  CharacterSet+Additional.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import Foundation

extension CharacterSet {
    
    static var latinLetters: CharacterSet {
        let characterString = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        return CharacterSet(charactersIn: characterString)
    }
}
