//
//  TableViewIndicatorView.swift
//  taboo
//
//  Created by Alisher Sattarbek on 3/24/21.
//

import UIKit
import SnapKit

final class TableViewIndicatorView: UIView {
    
    private lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .gray)
        view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        backgroundColor = .white
        addSubview(indicatorView)
        indicatorView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
        }
        
        indicatorView.startAnimating()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
