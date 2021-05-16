//
//  SignUpDetailInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/15/21.
//  
//

final class SignUpDetailInteractor {
    
    // MARK: Properties
    
    weak var output: SignUpDetailInteractorOutput?
    
    private var webService: WebServiceType
    
    init(webService: WebServiceType) {
        self.webService = webService
    }
    
}

extension SignUpDetailInteractor: SignUpDetailUseCase {
    func createUser(name: String, surname: String, phone: String, password: String, passwordConfirm: String) {
        let target = UserTarget.createUser(name: name, surname: surname, phone: phone, password: password, passwordConfirm: passwordConfirm)
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
