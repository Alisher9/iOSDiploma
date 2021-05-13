//
//  ParameterKeys.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/25/21.
//

import Foundation

struct JSONRequestParameter {
    
    struct User {
        static let phoneNumber = "phone"
        static let password = "password"
        static let passwordConfirmation = "password_confirmation"
        static let name = "name"
        static let surname = "surname"
    }
    
    struct Genres {
        static let genres = "genres"
    }
}
