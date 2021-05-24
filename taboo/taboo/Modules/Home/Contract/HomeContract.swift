//
//  HomeContract.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

protocol HomeView: ResultHandlingView {
}

protocol HomePresentation: class {
}

protocol HomeUseCase: class {
    func getAdvertisements(of type: FilmType?)
}

protocol HomeInteractorOutput: InteractorOutputProtocol {
}

protocol HomeWireframe: class {
}
