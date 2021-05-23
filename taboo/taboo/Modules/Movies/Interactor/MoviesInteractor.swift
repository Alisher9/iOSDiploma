//
//  MoviesInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/17/21.
//  
//

final class MoviesInteractor {
    
    // MARK: Properties
    
    weak var output: MoviesInteractorOutput?
    
    private var webService: WebServiceType
    
    init(webService: WebServiceType) {
        self.webService = webService
    }
    
}

extension MoviesInteractor: MoviesUseCase {
    func getMovies(of type: FilmType?) {
        guard let type = type else {
//            getMixedAdvertisements()
            return
        }
//        switch type {
//        case .feed:
//            getFeedAdvertisements { (advertisements, error) in
//                if let error = error {
//                    self.output?.handleError(error)
//                    return
//                }
//                self.output?.gotAdvertisements(advertisements: advertisements)
//            }
//        case .market:
//            getMarketAdvertisements { (advertisements, error) in
//                if let error = error {
//                    self.output?.handleError(error)
//                    return
//                }
//                self.output?.gotAdvertisements(advertisements: advertisements)
//            }
//        case .user:
//            getUserAdvertisements { (advertisements, error) in
//                if let error = error {
//                    self.output?.handleError(error)
//                    return
//                }
//                self.output?.gotAdvertisements(advertisements: advertisements)
//            }
        }
    }
    
    
//    func getFeedAdvertisements(completion: @escaping ([Advertisement], NetworkError?) -> Void) {
//        let target = AdvertisementTarget.getFeedAdvertisements
//        webService.load(target: target) { [weak self] (result) in
//            switch result {
//            case .success(let json):
//                self?.convertAdvertisements(from: json, completion: { [weak self] (advertisements, error) in
//                    if let error = error {
//                        self?.output?.handleError(error)
//                        return
//                    }
//                    completion(advertisements, nil)
//                })
//            case .error(let error):
//                self?.output?.handleError(error)
//                completion([], error)
//            }
//        }
//    }
//
//    func getMarketAdvertisements(completion: @escaping ([Advertisement], NetworkError?) -> Void) {
//        let target = AdvertisementTarget.getMarketAdvertisements
//        webService.load(target: target) { [weak self] (result) in
//            switch result {
//            case .success(let json):
//                self?.convertAdvertisements(from: json, completion: { [weak self] (advertisements, error) in
//                    if let error = error {
//                        self?.output?.handleError(error)
//                        return
//                    }
//                    completion(advertisements, nil)
//                })
//            case .error(let error):
//                self?.output?.handleError(error)
//                completion([], error)
//            }
//        }
//    }
//
//    func getUserAdvertisements(completion: @escaping ([Advertisement], NetworkError?) -> Void) {
//        let target = AdvertisementTarget.getUserAdvertisements
//        webService.load(target: target) { [weak self] (result) in
//            switch result {
//            case .success(let json):
//                self?.convertAdvertisements(from: json, completion: { [weak self] (advertisements, error) in
//                    if let error = error {
//                        self?.output?.handleError(error)
//                        return
//                    }
//                    completion(advertisements, nil)
//                })
//            case .error(let error):
//                self?.output?.handleError(error)
//                completion([], error)
//            }
//        }
//    }
//
//    func getMixedAdvertisements() {
//
//        let queue = DispatchQueue(label: AppConstants.DispatchQueueLabel.advertisements, attributes: .concurrent)
//
//        queue.async {
//
//            let group = DispatchGroup()
//            var mixedAdvertisements: [Advertisement] = []
//            var networkError: NetworkError?
//
//            group.enter()
//            self.getFeedAdvertisements { (advertisements, error) in
//                defer {
//                    group.leave()
//                }
//                if let error = error {
//                    networkError = error
//                    return
//                }
//                mixedAdvertisements.append(contentsOf: advertisements)
//            }
//
//            group.enter()
//            self.getMarketAdvertisements { (advertisements, error) in
//                defer {
//                    group.leave()
//                }
//                if let error = error {
//                    networkError = error
//                    return
//                }
//                mixedAdvertisements.append(contentsOf: advertisements)
//            }
//
//            group.wait()
//            DispatchQueue.main.async {
//                if let error = networkError {
//                    self.output?.handleError(error)
//                    return
//                }
//                self.output?.gotAdvertisements(advertisements: mixedAdvertisements)
//            }
//        }
//    }
//
//    func convertAdvertisements(from json: JSONStandard,
//                               completion: @escaping ([Advertisement], NetworkError?) -> Void) {
//        guard let data = json["data"] as? [JSONStandard] else {
//            completion([], .incorrectJSON)
//            return
//        }
//        var advertisements: [Advertisement] = []
//        for advertisement in data {
//            guard let attributes = advertisement["attributes"] as? JSONStandard else {
//                completion([], .incorrectJSON)
//                return
//            }
//
//            let id = advertisement[JSONRequestParameter.Advertisement.id] as? Int
//            let title = attributes[JSONRequestParameter.Advertisement.title] as? String
//            let text = attributes[JSONRequestParameter.Advertisement.text] as? String
//            let userId = attributes[JSONRequestParameter.Advertisement.userId] as? String
//            let createdDateString = advertisement[JSONRequestParameter.Advertisement.createdAt] as? String
//            let updatedDateString = advertisement[JSONRequestParameter.Advertisement.updatedAt] as? String
//
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = AppConstants.defaultTimeFormat
//
//            var createdDate: Date?
//            var updatedDate: Date?
//            if let createdDateString = createdDateString {
//                createdDate = dateFormatter.date(from: createdDateString)
//            }
//            if let updatedDateString = updatedDateString {
//                updatedDate = dateFormatter.date(from: updatedDateString)
//            }
//
//            let images = attributes[JSONRequestParameter.Advertisement.images] as? [JSONStandard] ?? []
//
//            let imageURLs = images.compactMap { $0[JSONRequestParameter.Advertisement.source] as? String }
//
//            let type = advertisement[JSONRequestParameter.Advertisement.type] as? String
//            guard let preConvertedType = type else {
//                continue
//            }
//            let convertedType = AdvertisementType(rawValue: preConvertedType)
//
//            advertisements.append(Advertisement(id: id,
//                                                title: title,
//                                                text: text,
//                                                userId: userId,
//                                                imageURLs: imageURLs,
//                                                type: convertedType,
//                                                createdTime: createdDate,
//                                                updatedTime: updatedDate))
//
//        }
//        completion(advertisements, nil)
//    }
//
//}
