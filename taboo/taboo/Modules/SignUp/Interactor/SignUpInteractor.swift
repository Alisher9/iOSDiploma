//
//  SignUpInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//  
//

final class SignUpInteractor {
    
    // MARK: Properties
    
    weak var output: SignUpInteractorOutput?
    
    private var webService: WebServiceType
    
    init(webService: WebServiceType) {
        self.webService = webService
    }
    
}

extension SignUpInteractor: SignUpUseCase {
}
