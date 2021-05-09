//
//  GenresInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/9/21.
//  
//

final class GenresInteractor {
    
    // MARK: Properties
    
    weak var output: GenresInteractorOutput?
    
    private var webService: WebServiceType
    
    init(webService: WebServiceType) {
        self.webService = webService
    }
    
}

extension GenresInteractor: GenresUseCase {
}
