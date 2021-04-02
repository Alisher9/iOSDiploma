//
//  InteractorOutputProtocol.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import Foundation
import UIKit

protocol InteractorOutputProtocol: class {
    var resultHandlingView: ResultHandlingView? { get }
    
    @discardableResult
    func handleError(_ error: NetworkError?) -> Bool
}

extension InteractorOutputProtocol {
    func handleError(_ error: NetworkError?) -> Bool {
        if let error = error {
            switch error {
            case .unauthorized:
                resultHandlingView?.showError(message: L10n.Common.unauthorized, completion: {
                    let notification = Notification(name: AppConstants.NotificationKey.didLogOut,
                                                    object: nil)
                    NotificationCenter.default.post(notification)
                })
            case .serverError(let reason):
                resultHandlingView?.showError(message: reason, completion: nil)
            case .wrongCredentials:
                resultHandlingView?.showError(message: L10n.Login.wrongCredentials, completion: nil)
            case .incorrectJSON, .networkFail, .unknownServerError:
                resultHandlingView?.showNetworkError()
            }
            return true
        } else {
            resultHandlingView?.hideNoNetwork()
            return false
        }
    }
}
