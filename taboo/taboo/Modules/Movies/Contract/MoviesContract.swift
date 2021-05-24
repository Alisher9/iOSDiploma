//
//  MoviesContract.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/17/21.
//  
//

protocol MoviesView: ResultHandlingView {
    func update(with movies: [Film])
}

protocol MoviesPresentation: class {
    func getMovies(of type: FilmType?)
    func didSelect(film: Film)
}

protocol MoviesUseCase: class {
    func getMovies(of type: FilmType?)
}

protocol MoviesInteractorOutput: InteractorOutputProtocol {
    func gotMovies(movies: [Film])
}

protocol MoviesWireframe: class {
    func showMovieCard()
}
