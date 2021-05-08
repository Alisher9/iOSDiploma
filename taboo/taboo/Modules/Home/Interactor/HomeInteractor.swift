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
}
