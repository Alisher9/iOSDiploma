//
//  GenrePickerInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/16/21.
//  
//

final class GenrePickerInteractor {
    
    // MARK: Properties
    
    weak var output: GenrePickerInteractorOutput?
    
//    private var webService: WebServiceType
    
    init() {
//        self.webService = webService
    }
    
}

extension GenrePickerInteractor: GenrePickerUseCase {
    func genrePicker(genres: [String]) {
//        let target = UserTarget.genrePicker(genres: genres)
//        webService.load(target: target) { [weak self] (result) in
//            switch result {
//            case .success(let json):
//                guard let success = json["success"] as? JSONStandard,
//                let token = success["token"] as? String else {
//                    self?.output?.handleError(.incorrectJSON)
//                    return
//                }
                self.output?.pickedGenres(token: "token")
//            case .error(let error):
//                self?.output?.handleError(error)
//            }
//        }
    }
    

}
