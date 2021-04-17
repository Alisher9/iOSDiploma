//
//  GenrePickerInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/16/21.
//  
//

final class GenrePickerInteractor {
    
    // MARK: Properties
    
    weak var output: GenrePickerInteractorOutput?
    
    private var webService: WebServiceType
    
    init(webService: WebServiceType) {
        self.webService = webService
    }
    
}

extension GenrePickerInteractor: GenrePickerUseCase {
}
