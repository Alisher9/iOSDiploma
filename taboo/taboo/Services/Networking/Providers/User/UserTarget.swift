//
//  UserTarget.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/23/21.
//

import Moya

enum UserTarget {
    case login(phoneNumber: String, password: String)
    case createUser(user: User)
}

extension UserTarget: BaseProviderType, AnyTargetConvertible {
    
    var path: String {
        switch self {
        case .login:
            return AppConstants.API.User.loginPath
        case .createUser:
            return AppConstants.API.User.createUser
        }
    }
    
    var method: Method {
        switch self {
        case .login, .createUser:
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
            return .requestParameters(parameters: jsonParameters, encoding: URLEncoding.queryString)
        case .createUser(let user):
            let jsonParameters: [String: Any] = [
                JSONRequestParameter.User.phoneNumber: user.phoneNumber ?? "",
                JSONRequestParameter.User.password: user.password ?? "",
                JSONRequestParameter.User.passwordConfirmation: user.passwordConfirmation ?? "",
                JSONRequestParameter.User.name: user.name ?? "",
                JSONRequestParameter.User.surname: user.surname ?? ""
            ]
            return .requestParameters(parameters: jsonParameters, encoding: URLEncoding.queryString)
        }
    }
}
