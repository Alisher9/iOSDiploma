//
//  HomeInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

final class HomeInteractor {
    
    // MARK: Properties
    
    weak var output: HomeInteractorOutput?
    
    private var webService: WebServiceType
    
    init(webService: WebServiceType) {
        self.webService = webService
    }
    
}

extension HomeInteractor: HomeUseCase {
    func getAdvertisements(of type: FilmType?) {
        guard let type = type else {
//            getMixedAdvertisements()
            return
        }
        switch type {
        case .feed:
            getFeedAdvertisements { (advertisements, error) in
                if let error = error {
                    self.output?.handleError(error)
                    return
                }
//                self.output?.gotAdvertisements(advertisements: advertisements)
            }
        case .market:
            print("")
        case .user:
            print("")
        }
    }
    
    func getFeedAdvertisements(completion: @escaping ([MovieCategory], NetworkError?) -> Void) {
        let target = UserTarget.home
        webService.load(target: target) { [weak self] (result) in
            switch result {
            case .success(let json):
                self?.convertAdvertisements(from: json, completion: { [weak self] (advertisements, error) in
                    if let error = error {
                        self?.output?.handleError(error)
                        return
                    }
                    completion(advertisements, nil)
                })
            case .error(let error):
                self?.output?.handleError(error)
                completion([], error)
            }
        }
    }
    
    func convertAdvertisements(from json: JSONStandard,
                               completion: @escaping ([MovieCategory], NetworkError?) -> Void) {
        guard let data = json["movies"] as? [JSONStandard] else {
            completion([], .incorrectJSON)
            return
        }
        var advertisements: [MovieCategory] = []
        for advertisement in data {
            guard let attributes = advertisement["attributes"] as? JSONStandard else {
                completion([], .incorrectJSON)
                return
            }
            
//            let id = advertisement[JSONRequestParameter.Advertisement.id] as? Int
//            let title = attributes[JSONRequestParameter.Advertisement.title] as? String
//            let text = attributes[JSONRequestParameter.Advertisement.text] as? String
//            let userId = attributes[JSONRequestParameter.Advertisement.userId] as? String
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
            print("/// data", attributes)

        }
        completion(advertisements, nil)
    }
    
}
