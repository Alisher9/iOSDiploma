//
//  LoginInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/23/21.
//  
//

final class LoginInteractor {
    
    // MARK: Properties
    
    weak var output: LoginInteractorOutput?
    
    private var webService: WebServiceType
    
    init(webService: WebServiceType) {
        self.webService = webService
    }
    
}

extension LoginInteractor: LoginUseCase {
    func login(phoneNumber: String, password: String) {
        let target = UserTarget.login(phoneNumber: phoneNumber, password: password)
        webService.load(target: target) { [weak self] (result) in
            switch result {
            case .success(let json):
                print("/// json", json)
                print("/// token", json["token"])
                print("/// expiry", json["expiry"])
                guard let token = json["token"] as? String else {
                        self?.output?.handleError(.incorrectJSON)
                        return
                }
                self?.output?.didLogin(token: token)
            case .error(let error):
                switch error {
                case .unauthorized:
                    self?.output?.handleError(.serverError(reason: L10n.Login.wrongCredentials))
                default:
                    self?.output?.handleError(error)
                }
            }
            
        }
    }
}
