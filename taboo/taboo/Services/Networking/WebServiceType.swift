//
//  WebServiceType.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import Moya

protocol WebServiceType: class {
    func load(target: AnyTargetConvertible, completion: @escaping (Result<JSONStandard>) -> Void)
    func loadData(target: AnyTargetConvertible, completion: @escaping (Result<Data>) -> Void)
}

final class WebService: WebServiceType {
    private let provider: MoyaProvider<AnyTarget>
    
    init(provider: MoyaProvider<AnyTarget>) {
        self.provider = provider
    }
    func load(target: AnyTargetConvertible, completion: @escaping (Result<JSONStandard>) -> Void) {
        provider.request(target.any, callbackQueue: DispatchQueue.main, progress: nil) { result in
            switch result {
            case .success(let response):
                if let jsonObject = try? JSONSerialization.jsonObject(with: response.data, options: []),
                    let json = jsonObject as? JSONStandard {
                    
                    if response.statusCode == 401 {
                        completion(.error(.unauthorized))
                        return
                    }
                    if response.statusCode == 422 {
                        completion(.error(.wrongCredentials))
                        return
                    }
                    completion(.success(json))
                } else {
                    completion(.error(.incorrectJSON))
                }
            case .failure:
                completion(.error(.networkFail))
            }
        }
    }
    
    func loadData(target: AnyTargetConvertible, completion: @escaping (Result<Data>) -> Void) {
        provider.request(target.any, callbackQueue: DispatchQueue.main, progress: nil) { result in
            switch result {
            case .success(let response):
                completion(.success(response.data))
            case .failure:
                completion(.error(.networkFail))
            }
        }
    }

}
