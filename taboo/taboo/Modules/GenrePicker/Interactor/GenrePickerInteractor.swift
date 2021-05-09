//
//  GenrePickerInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/16/21.
//  
//

import UIKit
import Moya

final class GenrePickerInteractor {
    
    // MARK: Properties
    
    weak var output: GenrePickerInteractorOutput?
    static var provider: MoyaProvider<AnyTarget>?
    
    init() {
    }
    
    func load(target: AnyTargetConvertible, completion: @escaping (Result<JSONStandard>) -> Void) {
        GenrePickerInteractor.provider?.request(target.any,
                                                callbackQueue: DispatchQueue.main,
                                                progress: nil) { result in
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
    
}

extension GenrePickerInteractor: GenrePickerUseCase {
    func genrePicker(genres: [String]) {
//        let target = UserTarget.genrePicker(genres: genres)
//        load(target: target) { [weak self] (result) in
//            switch result {
//            case .success(let json):
//                guard let success = json["success"] as? JSONStandard,
//                let token = success["token"] as? String else {
//                    self?.output?.handleError(.incorrectJSON)
//                    return
//                }
                self.output?.pickedGenres()
//            case .error(let error):
//                self?.output?.handleError(error)
//            }
//        }
    }
    

}
