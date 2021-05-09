//
//  ProfileMainInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

final class ProfileMainInteractor {
    
    // MARK: Properties
    
    weak var output: ProfileMainInteractorOutput?
    
    private var webService: WebServiceType
    
    init(webService: WebServiceType) {
        self.webService = webService
    }
    
}

extension ProfileMainInteractor: ProfileMainUseCase {
}
