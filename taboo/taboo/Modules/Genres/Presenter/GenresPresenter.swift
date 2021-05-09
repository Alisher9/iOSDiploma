//
//  GenresPresenter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/9/21.
//  
//

final class GenresPresenter {
    
    // MARK: Properties
    
    weak var view: GenresView?
    var router: GenresWireframe?
    var interactor: GenresUseCase?
}

extension GenresPresenter: GenresPresentation {
}

extension GenresPresenter: GenresInteractorOutput {
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
