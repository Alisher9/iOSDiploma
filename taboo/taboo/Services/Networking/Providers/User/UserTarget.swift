//
//  UserTarget.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/23/21.
//

import Moya

enum UserTarget {
    case login(phoneNumber: String, password: String)
    case createUser(name: String, surname: String, phone: String, password: String, passwordConfirm: String)
    case genrePicker(genres: [String])
}

extension UserTarget: BaseProviderType, AnyTargetConvertible {
    
    var path: String {
        switch self {
        case .login:
            return AppConstants.API.User.loginPath
        case .createUser:
            return AppConstants.API.User.createUser
        case .genrePicker:
            return AppConstants.API.User.genrePicker
        }
    }
    
    var method: Method {
        switch self {
        case .login, .createUser, .genrePicker:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .login(let phoneNumber, let password):
            let jsonParameters: [String: Any] = [
                JSONRequestParameter.User.phoneNumber: phoneNumber,
                JSONRequestParameter.User.password: password
            ]
            return .requestParameters(parameters: jsonParameters, encoding: JSONEncoding.default)
        case .createUser(let name, let surname, let phoneNumber, let password, let confirmPassword):
            let jsonParameters: [String: Any] = [
                JSONRequestParameter.User.phoneNumber: phoneNumber,
                JSONRequestParameter.User.password: password,
                JSONRequestParameter.User.passwordConfirmation: confirmPassword,
                JSONRequestParameter.User.name: name,
                JSONRequestParameter.User.surname: surname
            ]
            return .requestParameters(parameters: jsonParameters, encoding: JSONEncoding.default)
        case .genrePicker(let genres):
            let jsonParameters: [String: Any] = [
                JSONRequestParameter.Genres.genres: genres
            ]
            return .requestParameters(parameters: jsonParameters, encoding: URLEncoding.queryString)
        }
    }
}
