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
    func createUser(user: User) {
        let target = UserTarget.createUser(user: user)
        webService.load(target: target) { [weak self] (result) in
            switch result {
            case .success:
                self?.output?.userCreated()
            case .error(let error):
                switch error {
                case .wrongCredentials:
                    self?.output?.handleError(.serverError(reason: L10n.SignUp.passwordsDoesNotMatch))
                default:
                    self?.output?.handleError(error)
                }
            }
        }
    }
}
