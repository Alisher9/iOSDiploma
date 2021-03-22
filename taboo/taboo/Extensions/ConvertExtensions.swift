//
//  ConvertExtensions.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import Foundation

extension Int {
    func toString() -> String? {
        return String(self)
    }
}

extension Double {
    func toString() -> String? {
        return String(self)
    }
 }

extension String {
    func toInt() -> Int? {
        return Int(self)
    }
    
    func toDouble() -> Double? {
        return Double(self)
    }
}
