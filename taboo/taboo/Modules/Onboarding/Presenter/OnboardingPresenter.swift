//
//  OnboardingPresenter.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//  
//

final class OnboardingPresenter {
    
    // MARK: Properties
    
    weak var view: OnboardingView?
    var router: OnboardingWireframe?
    var interactor: OnboardingUseCase?
}

extension OnboardingPresenter: OnboardingPresentation {
    func didTapOnFinish() {
        interactor?.didFinishOnboarding()
        router?.finishOnboarding()
    }
}

extension OnboardingPresenter: OnboardingInteractorOutput {
    var resultHandlingView: ResultHandlingView? {
        return view
    }
}
