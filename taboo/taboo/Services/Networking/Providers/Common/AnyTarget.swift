//
//  AnyTarget.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import Moya

final class AnyTarget: BaseProviderType {
    
    let target: TargetType
    
    var baseURL: URL {
        return target.baseURL
    }
    
    var path: String {
        return target.path
    }
    
    var task: Task {
        return target.task
    }
    
    var method: Method {
        return target.method
    }
    
    var headers: [String : String]? {
        return target.headers
    }
    
    init(target: TargetType) {
        self.target = target
    }
    
}

protocol AnyTargetConvertible {
    var any: AnyTarget { get }
}

extension AnyTargetConvertible where Self: TargetType {
    var any: AnyTarget {
        return AnyTarget(target: self)
    }
}
