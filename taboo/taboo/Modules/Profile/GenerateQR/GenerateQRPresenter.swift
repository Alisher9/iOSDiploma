//
//  GenerateQRPresenter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/18/21.
//  
//

final class GenerateQRPresenter {
    
    // MARK: Properties
    
    weak var view: GenerateQRView?
    var router: GenerateQRWireframe?
    var interactor: GenerateQRUseCase?
}

extension GenerateQRPresenter: GenerateQRPresentation {
}

extension GenerateQRPresenter: GenerateQRInteractorOutput {
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
