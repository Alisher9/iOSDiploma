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
    var sessionTracker: SessionTracker?
}

extension GenrePickerPresenter: GenrePickerPresentation {
    func didTapOnNextButton(genres: [String]) {
        view?.showActivityIndicator()
        interactor?.genrePicker(genres: genres)
    }
    
}

extension GenrePickerPresenter: GenrePickerInteractorOutput {
    func pickedGenres(token: String) {
        view?.hideActivityIndicator()
//        self.sessionTracker?.didLogIn(token: token)
        router?.goToMainTabBar()
    }
    
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
