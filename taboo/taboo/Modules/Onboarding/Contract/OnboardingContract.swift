//
//  OnboardingContract.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//  
//

protocol OnboardingView: ResultHandlingView {
}

protocol OnboardingPresentation: class {
    func didTapOnFinish()
}

protocol OnboardingUseCase: class {
    func didFinishOnboarding()
}

protocol OnboardingInteractorOutput: InteractorOutputProtocol {
}

protocol OnboardingWireframe: class {
    func finishOnboarding()
}
