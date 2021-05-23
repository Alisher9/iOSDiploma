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
    
    private lazy var arrowIcon: UIImageView = {
       let image = UIImageView()
        image.image = Asset.arrowRightIcon.image
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = ColorName.lightGray.color
        return view
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
        addSubviews(titleLabel,
                    arrowIcon,
                    separatorLine)
    }
    
    private func configureConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(30)
        }
        
        arrowIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(30)
            $0.width.equalTo(10)
            $0.height.equalTo(18)
        }
        
        separatorLine.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Public actions
    
    func configure(_ style: TableViewLabelCellStyle) {
        switch style {
        case .regular:
            arrowIcon.isHidden = true
        case .hasDetails:
            arrowIcon.isHidden = false
        }
    }
    
    // MARK: - Private actions
    
}
