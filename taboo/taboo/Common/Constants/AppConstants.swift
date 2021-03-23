//
//  AppConstants.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import Foundation

struct AppConstants {
    
    static let defaultPhoneNumberFormat = "+X (XXX) XXX-XX-XX"
    static let defaultTimeFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    
    struct API {
        static let appUrl = URL(string: "https://api.korshi.tredo.co")!
        
        struct User {
            static let loginPath = "/api/auth/login"
            static let createUser = "/api/auth/create"
        }
    }
    
    struct KeyChain {
        struct Key {
            static let domain = "com.AlisherSattarbek.taboo"
            static let accessToken = "keychain.key.accessToken"
        }
    }
    
    struct SessionTracker {
        struct Key {
            static let launchedBefore = "sessionTracker.key.launchedBefore"
        }
    }
    
    struct NotificationKey {
        static let didLogOut = Notification.Name("notificationKey.didLogOut")
    }
}
