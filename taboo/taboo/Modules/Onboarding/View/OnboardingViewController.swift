//
//  OnboardingViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//  
//

import UIKit

final class OnboardingViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var presenter: OnboardingPresentation?
    
    // MARK: - Private properties
    
    private let onboardingImages = [
        Asset.onboarding1.image,
        Asset.onboarding2.image,
        Asset.onboarding3.image
    ]

    private let onboardingInfo = [
        OnboardingInfoModel(title: L10n.Onboarding.title1,
                            description: L10n.Onboarding.description1,
                            pageNumber: 0),
        OnboardingInfoModel(title: L10n.Onboarding.title2,
                            description: L10n.Onboarding.description2,
                            pageNumber: 1),
        OnboardingInfoModel(title: L10n.Onboarding.title3,
                            description: L10n.Onboarding.description3,
                            pageNumber: 2)
    ]
    
    private lazy var onboardingImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = onboardingImages.first
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var pageViewController: OnboardingPageViewController = {
        let vc = OnboardingPageViewController(onboardingInfo: onboardingInfo)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        vc.delegate = self
        addChild(vc)
        return vc
    }()

    private lazy var pageControl: SDPageControlView = {
        let view = SDPageControlView(numberOfPages: onboardingInfo.count)
        view.selectedPage = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1.0
        button.layer.borderColor = ColorName.mainPurple.color.cgColor
        button.layer.masksToBounds = true
        button.setTitleColor(ColorName.mainPurple.color, for: .normal)
        button.setTitle(L10n.Onboarding.next, for: .normal)
        button.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubviews(onboardingImageView, nextButton, pageViewController.view, pageControl)

        pageViewController.didMove(toParent: self)
    }
    
    private func configureConstraints() {
        nextButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-55)
        }

        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(nextButton.snp.top).offset(-20)
            $0.height.equalTo(50)
        }

        pageViewController.view.snp.makeConstraints {
            $0.bottom.equalTo(pageControl.snp.top).offset(-30)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(110)
        }

        onboardingImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(54)
            $0.top.equalToSuperview().offset(80)
            $0.trailing.equalToSuperview().offset(-54)
            $0.bottom.equalTo(pageViewController.view.snp.top).offset(-40)
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
    @objc private func didTapNext() {
        let currentPage = pageViewController.selectedPageNumber
        if currentPage == onboardingInfo.count - 1 {
            didTapFinish()
        } else {
            pageViewController.selectedPageNumber = currentPage + 1
            updatePage(pageNumber: currentPage + 1)
        }
    }

    private func didTapFinish() {
        presenter?.didTapOnFinish()
    }

    private func updatePage(pageNumber: Int) {
        guard pageControl.selectedPage != pageNumber else {
            return
        }
        pageControl.selectedPage = pageNumber
        UIView.animate(withDuration: 0.1, animations: {
            self.onboardingImageView.alpha = 0.1
        }, completion: { _ in
            self.onboardingImageView.image = self.onboardingImages[pageNumber]
            UIView.animate(withDuration: 0.2) {
                self.onboardingImageView.alpha = 1.0
            }
        })
        if pageNumber == onboardingInfo.count - 1 {
            UIView.animate(withDuration: 0.3, animations: {
                self.nextButton.setTitle(L10n.Onboarding.begin, for: .normal)
                self.nextButton.setTitleColor(.white, for: .normal)
                self.nextButton.backgroundColor = ColorName.mainPurple.color
            })

        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.nextButton.setTitle(L10n.Onboarding.next, for: .normal)
                self.nextButton.setTitleColor(ColorName.mainPurple.color, for: .normal)
                self.nextButton.backgroundColor = .white
            })
        }
    }
}

// MARK: - Extensions

extension OnboardingViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        guard let infoController = pageViewController.viewControllers?.first as? OnboardingInfoViewController else {
            return
        }
        let newPage = infoController.model?.pageNumber ?? 0
        updatePage(pageNumber: newPage)
    }
}

// MARK: - Nested types

private extension OnboardingViewController {
    
    enum Constants {
    }
    
}
