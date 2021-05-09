//
//  ProfileMainContract.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

protocol ProfileMainView: ResultHandlingView {
}

protocol ProfileMainPresentation: class {
    func didTapSettings()
}

protocol ProfileMainUseCase: class {
}

protocol ProfileMainInteractorOutput: InteractorOutputProtocol {
}

protocol ProfileMainWireframe: class {
    func showProfileSettings()
}
