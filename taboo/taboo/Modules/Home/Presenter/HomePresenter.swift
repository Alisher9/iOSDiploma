//
//  HomePresenter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

final class HomePresenter {
    
    // MARK: Properties
    
    weak var view: HomeView?
    var router: HomeWireframe?
    var interactor: HomeUseCase?
}

extension HomePresenter: HomePresentation {
}

extension HomePresenter: HomeInteractorOutput {
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
