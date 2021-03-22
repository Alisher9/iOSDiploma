//
//  NetworkError.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

enum NetworkError: Error {
    case incorrectJSON
    case networkFail
    case serverError(reason: String)
    case unknownServerError
    case unauthorized
    case wrongCredentials
}
