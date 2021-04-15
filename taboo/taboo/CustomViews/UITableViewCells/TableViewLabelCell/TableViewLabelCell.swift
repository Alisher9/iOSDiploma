//
//  TableViewLabelCell.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/15/21.
//

import UIKit
import SnapKit

final class TableViewLabelCell: UITableViewCell {
    
    // MARK: - Public properties
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    // MARK: - Private properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorName.textBlack.color
        label.numberOfLines = 1
        label.font = FontFamily.SFProDisplay.regular.font(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubview(titleLabel)
    }
    
    private func configureConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(30)
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
}
