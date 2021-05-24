//
//  AppConstants.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import Foundation

struct AppConstants {
    
    static let defaultPhoneNumberFormat = "+X (XXX) XXX-XX-XX"
    
    struct API {
//        static let appUrl = URL(string: "https://taboo20.herokuapp.com")!
        static let appUrl = URL(string: "https://c7286ae03971.ngrok.io")!
        
        struct User {
            static let loginPath = "/api/login/"
            static let createUser = "/api/register/"
            static let genrePicker = "/api/home/"
            static let home = "/api/genre/"
//            static let 
        }
        struct Image {
            
            static func getImage(fileName: String) -> String {
                return "/api/image/\(fileName)"
            }
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
