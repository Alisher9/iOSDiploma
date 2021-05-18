//
//  GenerateQRInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/18/21.
//  
//

final class GenerateQRInteractor {
    
    // MARK: Properties
    
    weak var output: GenerateQRInteractorOutput?
    
    private var webService: WebServiceType
    
    init(webService: WebServiceType) {
        self.webService = webService
    }
    
}

extension GenerateQRInteractor: GenerateQRUseCase {
}
