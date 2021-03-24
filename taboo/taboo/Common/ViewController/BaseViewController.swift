//
//  BaseViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/22/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Public properties
    
    override var title: String? {
        get {
            navBar.title
        }
        set {
            navBar.title = newValue
        }
    }
    
    var navigationBarHidden: Bool {
        get {
            if navigationController?.viewControllers.count ?? 0 < 2 {
                return true
            }
            return _navigationBarHidden
        }
        set {
            _navigationBarHidden = newValue
            updateNavBar(hidden: newValue)
        }
    }
    
    // MARK: - Private properties
    
    private var _navigationBarHidden = false
    
    private lazy var navBar: MainNavigationBar = {
        let view = MainNavigationBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
        updateNavBar(hidden: navigationBarHidden)
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = .white
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubviews(navBar)
    }
    
    private func configureConstraints() {
        navBar.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-Constants.navbarHeight)
            $0.height.equalTo(Constants.navbarHeight)
        }
    }
    
    // MARK: - Public actions
    
    func addObserverForKeyboardNotification(with scrollView: UIScrollView? = nil) {
        registerForKeyboardWillShowNotification(with: scrollView)
        registerForKeyboardWillHideNotification(with: scrollView)
    }
    
    func disableNavBarBackButton() {
        navBar.isUserInteractionEnabled = false
    }
    
    func enableNavBarBackButton() {
        navBar.isUserInteractionEnabled = true
    }
    
    func keyboardWillShow(with keyboardSize: CGSize) {
    }
    
    func keyboardWillHide(with keyboardSize: CGSize) {
    }
    
    // MARK: - Private actions
    
    private func updateNavBar(hidden: Bool) {
        navBar.isHidden = hidden
        let topInset = hidden ? 0 : Constants.navbarHeight
        additionalSafeAreaInsets = UIEdgeInsets(top: CGFloat(topInset), left: 0, bottom: 0, right: 0)
    }
    
    private func registerForKeyboardWillShowNotification(with scrollView: UIScrollView?) {
        let block: (Notification) -> Void = { [weak self] notification -> Void in
            let userInfo = notification.userInfo
            let keyboardSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size
            if let scrollView = scrollView {
                let contentInsets = UIEdgeInsets(top: scrollView.contentInset.top,
                                                 left: scrollView.contentInset.left,
                                                 bottom: keyboardSize.height,
                                                 right: scrollView.contentInset.right)
                scrollView.contentInset = contentInsets
                scrollView.scrollIndicatorInsets = contentInsets
            }
            self?.keyboardWillShow(with: keyboardSize)
        }
        _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                                   object: nil,
                                                   queue: nil,
                                                   using: block)
    }

    private func registerForKeyboardWillHideNotification(with scrollView: UIScrollView?) {
        let block: (Notification) -> Void = { [weak self] notification -> Void in
            let userInfo = notification.userInfo
            let keyboardSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size
            if let scrollView = scrollView {
                let contentInsets = UIEdgeInsets(top: scrollView.contentInset.top,
                                                 left: scrollView.contentInset.left,
                                                 bottom: 0,
                                                 right: scrollView.contentInset.right)

                scrollView.contentInset = contentInsets
                scrollView.scrollIndicatorInsets = contentInsets
            }
            self?.keyboardWillHide(with: keyboardSize)
        }
        _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                                   object: nil,
                                                   queue: nil,
                                                   using: block)
    }
    
}

extension BaseViewController: MainNavigationBarDelegate {
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Nested types

private extension BaseViewController {
    
    enum Constants {
        static let navbarHeight: CGFloat = 46
    }
    
}
