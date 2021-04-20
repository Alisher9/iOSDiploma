//
//  GenrePickerContract.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/16/21.
//  
//

protocol GenrePickerView: ResultHandlingView {
}

protocol GenrePickerPresentation: class {
    func didTapOnNextButton()
}

protocol GenrePickerUseCase: class {
}

protocol GenrePickerInteractorOutput: InteractorOutputProtocol {
}

protocol GenrePickerWireframe: class {
    func goToMainTabBar()
}
