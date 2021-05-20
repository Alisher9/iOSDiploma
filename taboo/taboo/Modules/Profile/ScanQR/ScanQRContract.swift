//
//  ScanQRContract.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/18/21.
//  
//

protocol ScanQRView: ResultHandlingView {
}

protocol ScanQRPresentation: class {
    func didTapReset()
}

protocol ScanQRUseCase: class {
}

protocol ScanQRInteractorOutput: InteractorOutputProtocol {
}

protocol ScanQRWireframe: class {
    func popToRoot()
}
