//
//  SignUpViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//  
//

import UIKit

final class SignUpViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var presenter: SignUpPresentation?
    
    // MARK: - Private properties
    
    private var rows: [TableViewCellType] = [
        .info(title: L10n.SignUp.infoTitle),
        .textField(style: .regular,
                   placeholder: L10n.SignUp.enterName,
                   key: JSONRequestParameter.User.name,
                   editable: true,
                   fontStyle: TextFieldFontStyle.regular,
                   textColor: ColorName.darkGray.color),
        .textField(style: .regular,
                   placeholder: L10n.SignUp.enterSurname,
                   key: JSONRequestParameter.User.surname,
                   editable: true,
                   fontStyle: TextFieldFontStyle.regular,
                   textColor: ColorName.darkGray.color),
        .textField(style: .phoneNumber,
                   placeholder: L10n.SignUp.enterPhoneNumber,
                   key: JSONRequestParameter.User.phoneNumber,
                   editable: true,
                   fontStyle: TextFieldFontStyle.regular,
                   textColor: ColorName.darkGray.color),
        .textField(style: .password,
                   placeholder: L10n.SignUp.enterPassword,
                   key: JSONRequestParameter.User.password,
                   editable: true,
                   fontStyle: TextFieldFontStyle.regular,
                   textColor: ColorName.darkGray.color),
        .textField(style: .password,
                   placeholder: L10n.SignUp.enterPasswordAgain,
                   key: JSONRequestParameter.User.passwordConfirmation,
                   editable: true,
                   fontStyle: TextFieldFontStyle.regular,
                   textColor: ColorName.darkGray.color),
        .button(title: L10n.SignUp.register)
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.register(TableViewTextFieldCell.self)
        tableView.register(TableViewInfoCell.self)
        tableView.register(TableViewButtonCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var data: [String: String] = [:]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObserverForKeyboardNotification(with: tableView)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Setup
    
    private func setupView() {
        title = L10n.SignUp.registration
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubviews(tableView)
    }
    
    private func configureConstraints() {
        tableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
}

// MARK: - Extensions

extension SignUpViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
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
            cell.textFieldChangeAction = { [weak self] (key, value) in
                self?.data[key] = value
                self?.presenter?.updateUser(with: self?.data ?? [:])
            }
            cell.textfieldText = data[key]
            return cell
        case .button(let title):
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TableViewButtonCell
            cell.configure(title: title)
            cell.buttonAction = { [weak self] in
                self?.view.resignFirstResponder()
                self?.presenter?.didTapContinue()
            }
            return cell
        default:
            return rows[indexPath.row].cell(forTableView: tableView, forRowAt: indexPath)
        }
        
    }
}

extension SignUpViewController: SignUpView {
    func update(with data: [String : String]) {
        self.data = data
        tableView.reloadData()
    }
    
}

// MARK: - Nested types

private extension SignUpViewController {
    
    enum Constants {
    }
    
}
