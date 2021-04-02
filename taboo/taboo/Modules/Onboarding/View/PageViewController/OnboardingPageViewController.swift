//
//  OnboardingPageViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {
    
    var selectedPageNumber: Int {
        get {
            guard let currentVC = viewControllers?.first as? OnboardingInfoViewController else {
                return 0
            }
            return currentVC.model?.pageNumber ?? 0
        }
        set {
            setViewControllers([pages[newValue]], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private let models: [OnboardingInfoModel]

    private var pages: [UIViewController] = [UIViewController]()
    
    init(onboardingInfo: [OnboardingInfoModel]) {
        self.models = onboardingInfo
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        for model in models {
            let vc = OnboardingInfoViewController()
            vc.model = model
            pages.append(vc)
        }
        
        setViewControllers([pages[0]], direction: .forward, animated: false, completion: nil)
    }

}

// typical Page View Controller Data Source
extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }

        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0,
            pages.count > previousIndex else {
                return nil
        }
        
        return pages[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }

        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pages.count,
            pages.count > nextIndex else {
                return nil
        }

        return pages[nextIndex]
    }
}
