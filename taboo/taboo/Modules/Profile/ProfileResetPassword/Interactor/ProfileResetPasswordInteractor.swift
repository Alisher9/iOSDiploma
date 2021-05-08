//
//  ProfileResetPasswordInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

final class ProfileResetPasswordInteractor {
    
    // MARK: Properties
    
    weak var output: ProfileResetPasswordInteractorOutput?
    
    private var webService: WebServiceType
    
    init(webService: WebServiceType) {
        self.webService = webService
    }
    
}

extension ProfileResetPasswordInteractor: ProfileResetPasswordUseCase {
}
