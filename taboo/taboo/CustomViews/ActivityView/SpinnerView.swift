//
//  SpinnerView.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//

import UIKit

final class SpinnerView: UIView {
    
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
    
    private lazy var indicatorView: SpinnerIndicator = {
        let view = SpinnerIndicator()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let spinnerSize: CGSize
    
    init(size: CGSize = CGSize(width: 35, height: 35)) {
        self.spinnerSize = size
        super.init(frame: .zero)
        clipsToBounds = true
        backgroundColor = Const.backgroundColor
        addSubview(contentView)
        addSubview(indicatorView)
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 120.0),
            contentView.widthAnchor.constraint(equalToConstant: 120.0),
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            indicatorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            indicatorView.widthAnchor.constraint(equalToConstant: spinnerSize.width),
            indicatorView.heightAnchor.constraint(equalToConstant: spinnerSize.height)
        ])
        indicatorView.startAnimating()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

