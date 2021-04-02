//
//  OnboardingInteractor.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//  
//

final class OnboardingInteractor {
    
    // MARK: Properties
    
    weak var output: OnboardingInteractorOutput?
    
    private var sessionTracker: SessionTracker
    
    init(sessionTracker: SessionTracker) {
        self.sessionTracker = sessionTracker
    }
    
}

extension OnboardingInteractor: OnboardingUseCase {
    func didFinishOnboarding() {
        sessionTracker.isFirstLaunch = false
    }
}
