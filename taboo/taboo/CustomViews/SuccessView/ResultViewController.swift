//
//  ResultViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/15/21.
//

import UIKit
import SnapKit

final class ResultViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var detailText: String? {
        didSet {
            resultView.detailText = detailText
        }
    }
    
    var isSuccess = true {
        didSet {
            resultView.isSuccess = isSuccess
        }
    }
    
    var completion: (() -> Void)?
    
    // MARK: - Private properties
    
    private lazy var resultView: ResultView = {
        let view = ResultView()
        view.closeAction = { [weak self] in
            self?.close()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var animationShown = false
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !animationShown {
            animateAppearance()
            animationShown = true
        }
    }
    
    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = .clear
        configureSubviews()
        configureConstraints()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(close))
        view.addGestureRecognizer(tap)
        
        resultView.alpha = 0.0
        resultView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2.0)
            .concatenating(CGAffineTransform(scaleX: 0.3, y: 0.3))
    }
    
    private func configureSubviews() {
        view.addSubview(resultView)
    }
    
    private func configureConstraints() {
        resultView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(55)
            $0.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
    @objc private func close() {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = .clear
            self.resultView.alpha = 0.0
        }, completion: { _ in
            self.dismiss(animated: false, completion: nil)
            self.completion?()
        })
    }
    
    private func animateAppearance() {
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
            self.resultView.alpha = 1.0
        }
        
        UIView.animate(withDuration: 0.9,
                       delay: 0.0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.8,
                       options: [.curveEaseOut, .allowUserInteraction],
                       animations: {
            self.resultView.transform = .identity
        })
        
    }
    
}
