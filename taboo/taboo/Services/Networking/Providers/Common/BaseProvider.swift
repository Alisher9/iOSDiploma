//
//  BaseProvider.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import Moya

protocol BaseProviderType: TargetType {}

extension BaseProviderType {
    
    var baseURL: URL {
        return AppConstants.API.appUrl
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var headers: [String : String]? {
        return [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer \(AuthenticationStore.shared.getAccessToken() ?? "")"
        ]
    }
    
    var validate: Bool {
        return true
    }
}
