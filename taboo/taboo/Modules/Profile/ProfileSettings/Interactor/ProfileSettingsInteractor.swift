//
//  ProfileSettingsInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

final class ProfileSettingsInteractor {
    
    // MARK: Properties
    
    weak var output: ProfileSettingsInteractorOutput?
    
    private var webService: WebServiceType
    
    init(webService: WebServiceType) {
        self.webService = webService
    }
    
}

extension ProfileSettingsInteractor: ProfileSettingsUseCase {
}
