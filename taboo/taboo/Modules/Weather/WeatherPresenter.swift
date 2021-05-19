//
//  WeatherPresenter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/19/21.
//  
//

final class WeatherPresenter {
    
    // MARK: Properties
    
    weak var view: WeatherView?
    var router: WeatherWireframe?
    var interactor: WeatherUseCase?
}

extension WeatherPresenter: WeatherPresentation {
}

extension WeatherPresenter: WeatherInteractorOutput {
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
