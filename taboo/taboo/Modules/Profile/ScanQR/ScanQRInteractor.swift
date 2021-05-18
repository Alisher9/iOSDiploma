//
//  ScanQRInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/18/21.
//  
//

final class ScanQRInteractor {
    
    // MARK: Properties
    
    weak var output: ScanQRInteractorOutput?
    
    private var webService: WebServiceType
    
    init(webService: WebServiceType) {
        self.webService = webService
    }
    
}

extension ScanQRInteractor: ScanQRUseCase {
}
