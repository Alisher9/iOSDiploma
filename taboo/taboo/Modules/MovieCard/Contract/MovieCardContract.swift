//
//  MovieCardContract.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/17/21.
//  
//

protocol MovieCardView: ResultHandlingView {
    func update(with movie: Film, movieType: FilmType)
    func update(with user: User)
}

protocol MovieCardPresentation: class {
    func viewDidLoad()
}

protocol MovieCardUseCase: class {
}

protocol MovieCardInteractorOutput: InteractorOutputProtocol {
}

protocol MovieCardWireframe: class {
}
