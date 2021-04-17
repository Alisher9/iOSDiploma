//
//  GenrePickerPresenter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/16/21.
//  
//

final class GenrePickerPresenter {
    
    // MARK: Properties
    
    weak var view: GenrePickerView?
    var router: GenrePickerWireframe?
    var interactor: GenrePickerUseCase?
}

extension GenrePickerPresenter: GenrePickerPresentation {
}

extension GenrePickerPresenter: GenrePickerInteractorOutput {
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
