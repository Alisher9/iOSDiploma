//
//  ProfileSettingsViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/8/21.
//  
//

import UIKit

final class ProfileSettingsViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var presenter: ProfileSettingsPresentation?
    
    // MARK: - Private properties
    
    private var rows: [TableViewCellType] = [
        .label(title: "Мой QR код", style: .hasDetails),
        .label(title: "Сканировать QR код", style: .hasDetails),
        .label(title: L10n.Profile.changePassword, style: .hasDetails),
        .label(title: L10n.Profile.logout, style: .regular)
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 60
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(TableViewLabelCell.self)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        title = L10n.Profile.settings
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubviews(tableView)
    }
    
    private func configureConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
}

// MARK: - Extensions

extension ProfileSettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch rows[indexPath.row] {
        case .label(title: let title, style: let style):
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TableViewLabelCell
            cell.configure(style)
            cell.title = title
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}

extension ProfileSettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            presenter?.didSelectGenerateQR()
        } else if indexPath.row == 1 {
            presenter?.didSelectScanQR()
        } else if indexPath.row == 2 {
            presenter?.didSelectResetPassword()
        }
         else {
            presenter?.didSelectLogOut()
        }
    }
    
}

extension ProfileSettingsViewController: ProfileSettingsView {
}

// MARK: - Nested types

private extension ProfileSettingsViewController {
    
    enum Constants {
    }
    
}
