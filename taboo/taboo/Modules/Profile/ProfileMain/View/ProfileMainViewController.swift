//
//  ProfileMainViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

import UIKit

final class ProfileMainViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var presenter: ProfileMainPresentation?
    var user: User? {
        didSet {
            profileHeaderView.viewModel = ProfileHeaderViewModel(profileImage: nil,
                                                                 name: "Alisher",
                                                                 surname: "Sattarbek",
                                                                 phone: "87084910634")
        }
    }
    
    var moviesModuleBuilder: MoviesModuleBuilder?
    
    // MARK: - Private properties
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.backgroundColor = .white
        view.delegate = self
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.1
        view.layer.shadowColor = ColorName.darkGray.color.cgColor
        view.viewModel = ProfileHeaderViewModel(profileImage: nil,
                                                name: "Alisher",
                                                surname: "Sattarbek",
                                                phone: "87084910634")
        return view
    }()
    
    private lazy var moviesViewController: MoviesViewController = {
        guard let vc = moviesModuleBuilder?.viewController as? MoviesViewController else {
            assertionFailure("Can't get MoviesViewController")
            return MoviesViewController()
        }
        vc.delegate = self
        vc.tableViewContentInset = UIEdgeInsets(top: 255, left: 0, bottom: 0, right: 0)
        vc.movieType = .user
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(vc)
        return vc
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = ColorName.lightGray.color
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubviews(moviesViewController.view, profileHeaderView)
    }
    
    private func configureConstraints() {
        
        moviesViewController.view.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(view.safeAreaLayoutGuide)
        }

        profileHeaderView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
    private func showAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: L10n.Common.edit,
                                      style: UIAlertAction.Style.default,
                                      handler: { _ in
                                        self.showImagePicker()
        }))
        alert.addAction(UIAlertAction(title: L10n.Common.delete,
                                      style: UIAlertAction.Style.destructive,
                                      handler: { _ in
                                        self.profileHeaderView.viewModel?.profileImage = nil
        }))
        alert.addAction(UIAlertAction(title: L10n.Common.cancel,
                                      style: UIAlertAction.Style.cancel,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
}

    // MARK: - Extensions

extension ProfileMainViewController: ProfileMainView {
    func update(with user: User) {
        self.user = user
    }
}

extension ProfileMainViewController: ProfileHeaderViewDelegate {
    
    func profileImageTapped() {
        showAlert()
    }
    
    func settingsIconTapped() {
        presenter?.didTapSettings()
    }
}

extension ProfileMainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        10
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        10
    }
    
}

extension ProfileMainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileHeaderView.viewModel?.profileImage = image
            picker.dismiss(animated: true)
        }
    }
}

extension ProfileMainViewController: MovieViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentInset.top + scrollView.contentOffset.y
        profileHeaderView.offset = max(0, offset)
    }
}
    // MARK: - Nested types

private extension ProfileMainViewController {
    
    enum Constants {
    }
    
}
