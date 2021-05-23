//
//  SignUpContainer.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/15/21.
//

import Foundation

protocol UserContainer {
    var user: User { get set }
}

final class SignUpContainer: UserContainer {
    var user: User
    
    init() {
        user = User()
    }
}
