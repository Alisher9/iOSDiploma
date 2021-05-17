//
//  MovieCardPresenter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/17/21.
//  
//

import Foundation

final class MovieCardPresenter {
    
    // MARK: Properties
    
    weak var view: MovieCardView?
    var router: MovieCardWireframe?
    var interactor: MovieCardUseCase?
    
    var sessionTracker: SessionTracker?
    
    var movieContainer: MovieContainer?
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension MovieCardPresenter: MovieCardPresentation {
    func viewDidLoad() {
        guard let movie = movieContainer?.movie else {
            assertionFailure("Error getting selected movie")
            return
        }
        guard let movieType = movie.type else {
            return
        }
        view?.update(with: movie, movieType: movieType)
        
        view?.showActivityIndicator()
//        if let user = sessionTracker?.currentUser {
//            view?.hideActivityIndicator()
//            view?.update(with: user)
//        } else {
//            sessionTracker?.updateUser()
//        }
        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(updateUser(_:)),
//                                               name: AppConstants.NotificationKey.userUpdated,
//                                               object: nil)
    }
    
    @objc private func updateUser(_ notification: NSNotification) {
        guard let user = notification.object as? User else {
            return
        }
        view?.hideActivityIndicator()
        view?.update(with: user)
    }
}

extension MovieCardPresenter: MovieCardInteractorOutput {
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
