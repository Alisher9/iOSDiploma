//
//  ActivityView.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//

import UIKit

final class ActivityView: UIView {
    
    private enum Const {
        static let backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.95, alpha: 0.3)
        static let contentViewBackgroundColor = UIColor(red: 0.87, green: 0.89, blue: 0.94, alpha: 0.0)
    }
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = Const.contentViewBackgroundColor
        view.layer.cornerRadius = 8.0
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .gray)
        view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        backgroundColor = Const.backgroundColor
        addSubview(contentView)
        addSubview(indicatorView)
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 60.0),
            contentView.widthAnchor.constraint(equalToConstant: 60.0),
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            indicatorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        indicatorView.startAnimating()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
