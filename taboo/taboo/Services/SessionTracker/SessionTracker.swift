//
//  SessionTracker.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

protocol SessionTracker: class {
    var isLoggedIn: Bool { get }
    var isFirstLaunch: Bool { get set }
    
    func didLogIn(token: String)
    func didLogWithGenres()
    func logOut()
}
