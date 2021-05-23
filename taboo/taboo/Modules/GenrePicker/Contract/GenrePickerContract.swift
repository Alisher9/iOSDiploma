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
    func didTapGenres(genres: [String])
}

protocol GenrePickerUseCase: class {
    func genrePicker(genres: [String])
}

protocol GenrePickerInteractorOutput: InteractorOutputProtocol {
    func pickedGenres()
}

protocol GenrePickerWireframe: class {
}
