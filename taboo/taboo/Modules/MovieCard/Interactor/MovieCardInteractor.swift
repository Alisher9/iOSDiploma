//
//  MovieCardInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/17/21.
//  
//

final class MovieCardInteractor {
    
    // MARK: Properties
    
    weak var output: MovieCardInteractorOutput?
    
    private var webService: WebServiceType
    
    init(webService: WebServiceType) {
        self.webService = webService
    }
    
}

extension MovieCardInteractor: MovieCardUseCase {
}
