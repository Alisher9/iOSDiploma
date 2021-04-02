//
//  ResultHandlingView.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import Foundation

protocol ResultHandlingView: IndicatableView {
    func showSuccess(message: String?, completion: (() -> Void)?)
    func showNetworkError()
    func showError(message: String?, completion: (() -> Void)?)
    func hideNoNetwork()
}
