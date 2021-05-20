//
//  ScanQRPresenter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/18/21.
//  
//

final class ScanQRPresenter {
    
    // MARK: Properties
    
    weak var view: ScanQRView?
    var router: ScanQRWireframe?
    var interactor: ScanQRUseCase?
}

extension ScanQRPresenter: ScanQRPresentation {
    func didTapReset() {
        view?.showSuccess(message: "Вы успешно отсканировали QR код") { [weak self] in
            self?.router?.popToRoot()
        }
    }
    
}

extension ScanQRPresenter: ScanQRInteractorOutput {
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
