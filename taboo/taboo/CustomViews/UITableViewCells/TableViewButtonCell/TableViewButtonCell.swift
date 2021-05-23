//
//  TableViewButtonCell.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/7/21.
//

import UIKit

final class TableViewButtonCell: UITableViewCell {
    
    // MARK: - Public properties
    
    var buttonAction: (() -> Void)?
    
    var buttonIsActive: Bool {
        get {
            return saveButton.isActive
        }
        set {
            saveButton.isActive = newValue
        }
    }
    
    // MARK: - Private properties
    
    private lazy var saveButton: MainButton = {
       let button = MainButton()
        button.isActive = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupCell() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        contentView.addSubviews(saveButton)
    }
    
    private func configureConstraints() {
        saveButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
            $0.top.bottom.equalToSuperview().inset(10)
        }
    }
    
    // MARK: - Public actions
    
    func configure(title: String) {
        saveButton.setTitle(title, for: .normal)
    }
    
    // MARK: - Private actions
    
    @objc private func didTapButton() {
        buttonAction?()
    }
    
}
