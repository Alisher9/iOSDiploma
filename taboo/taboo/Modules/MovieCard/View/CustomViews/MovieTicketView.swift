//
//  MovieTicketView.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/18/21.
//

import UIKit
import SnapKit

final class MovieTicketView: UIView {
    
    private lazy var ticketImage: UIImageView = {
       let image = UIImageView()
        image.image = Asset.ticket.image
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var movieDetailsLabel: UILabel = {
       let label = UILabel()
        label.text = "Movie Details"
        label.textColor = Color.black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        addSubview(ticketImage)
        ticketImage.addSubview(movieDetailsLabel)
    }
    
    private func configureConstraints() {
        ticketImage.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        movieDetailsLabel.snp.makeConstraints {
            $0.top.equalTo(ticketImage.snp.top).offset(66)
            $0.left.equalToSuperview().offset(21)
        }
    }
}
