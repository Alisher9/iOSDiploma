//
//  ProfileSettingsContract.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

protocol ProfileSettingsView: ResultHandlingView {
}

protocol ProfileSettingsPresentation: class {
    func didSelectGenerateQR()
    func didSelectScanQR()
    func didSelectResetPassword()
    func didSelectLogOut()
}

protocol ProfileSettingsUseCase: class {
}

protocol ProfileSettingsInteractorOutput: InteractorOutputProtocol {
}

protocol ProfileSettingsWireframe: class {
    func showGenerateQR()
    func showScanQR()
    func showResetPasswordPage()
    func showLoginPage()
}
