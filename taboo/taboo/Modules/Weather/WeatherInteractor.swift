//
//  WeatherInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/19/21.
//  
//

final class WeatherInteractor {
    
    // MARK: Properties
    
    weak var output: WeatherInteractorOutput?
    
    private var webService: WebServiceType
    
    init(webService: WebServiceType) {
        self.webService = webService
    }
    
}

extension WeatherInteractor: WeatherUseCase {
}
