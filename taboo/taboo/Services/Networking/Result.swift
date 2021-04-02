//
//  Result.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

enum Result<A> {
    case success(A)
    case error(NetworkError)
    
    init(_ value: A?, or error: NetworkError) {
        if let value = value {
            self = .success(value)
        } else {
            self = .error(error)
        }
    }
}

extension Result {
    func map<B>(_ transform: (A) -> (B)) -> Result<B> {
        switch self {
        case .success(let value):
            return .success(transform(value))
        case .error(let error):
            return .error(error)
        }
    }
}

