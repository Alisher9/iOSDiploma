//
//  StringExtension.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import Foundation

extension String {
    func toPhoneNumber() -> String {
        return self.replacingOccurrences(of: "+7", with: "7").replacingOccurrences(of: "[^0-9]",
                                                                                   with: "",
                                                                                   options: .regularExpression)
    }
}
