//
//  ProfileMainContract.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

protocol ProfileMainView: ResultHandlingView {
    func update(with user: User)
}

protocol ProfileMainPresentation: class {
    func didTapSettings()
    func viewDidLoad()
}

protocol ProfileMainUseCase: class {
}

protocol ProfileMainInteractorOutput: InteractorOutputProtocol {
}

protocol ProfileMainWireframe: class {
    func showProfileSettings()
}
