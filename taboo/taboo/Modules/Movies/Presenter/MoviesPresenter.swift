//
//  MoviesPresenter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/17/21.
//  
//

final class MoviesPresenter {
    
    // MARK: Properties
    
    weak var view: MoviesView?
    var router: MoviesWireframe?
    var interactor: MoviesUseCase?
    
    var movieContainer: MovieContainer?
}

extension MoviesPresenter: MoviesPresentation {
    func getMovies(of type: FilmType?) {
        view?.showActivityIndicator()
        interactor?.getMovies(of: type)
    }
    
    func didSelect(film: Film) {
        movieContainer?.movie = film
        router?.showMovieCard()
    }
    
}

extension MoviesPresenter: MoviesInteractorOutput {
    func gotMovies(movies: [Film]) {
        view?.hideActivityIndicator()
        view?.update(with: movies)
    }
    
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
