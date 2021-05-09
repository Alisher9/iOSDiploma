//
//  ProfileResetPasswordViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

import UIKit

final class ProfileResetPasswordViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var presenter: ProfileResetPasswordPresentation?
    
    // MARK: - Private properties
    
    private var rows: [TableViewCellType] = [
        .textField(style: .password,
                   placeholder: L10n.Profile.currentPassword,
                   key: JSONRequestParameter.User.password,
                   editable: true,
                   fontStyle: TextFieldFontStyle.regular,
                   textColor: ColorName.darkGray.color),
        .textField(style: .password,
                   placeholder: L10n.Profile.newPassword,
                   key: JSONRequestParameter.User.password,
                   editable: true,
                   fontStyle: TextFieldFontStyle.regular,
                   textColor: ColorName.darkGray.color),
        .textField(style: .password,
                   placeholder: L10n.Profile.confirmPassword,
                   key: JSONRequestParameter.User.password,
                   editable: true,
                   fontStyle: TextFieldFontStyle.regular,
                   textColor: ColorName.darkGray.color)
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.register(TableViewTextFieldCell.self)
        tableView.bounces = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var resetButton: MainButton = {
        let button = MainButton()
        button.isActive = true
        button.addTarget(self, action: #selector(didTapReset), for: .touchUpInside)
        button.setTitle(L10n.Profile.resetPassword, for: .normal)
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
        title = L10n.Profile.password
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubviews(tableView,
                         resetButton)
    }
    
    private func configureConstraints() {
        
        tableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.bottom.equalTo(resetButton.snp.top)
        }
        
        resetButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(85)
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
    @objc private func didTapReset() {
        presenter?.didTapReset()
    }
}

// MARK: - Extensions

extension ProfileResetPasswordViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch rows[indexPath.row] {
        case .textField(let style,
                        let placeholder,
                        let key,
                        let editable,
                        let fontStyle,
                        let textColor):
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TableViewTextFieldCell
            cell.configure(style: style,
                           placeholder: placeholder,
                           key: key,
                           editable: editable,
                           fontStyle: fontStyle,
                           textColor: textColor)
            return cell
        default:
            return rows[indexPath.row].cell(forTableView: tableView, forRowAt: indexPath)
        }
    }
    
}

extension ProfileResetPasswordViewController: ProfileResetPasswordView {
}

// MARK: - Nested types

private extension ProfileResetPasswordViewController {
    
    enum Constants {
    }
    
}
