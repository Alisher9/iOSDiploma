//
//  ScanQRViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/18/21.
//  
//

import UIKit
import MercariQRScanner

final class ScanQRViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var presenter: ScanQRPresentation?
    
    // MARK: - Private properties
//    private let flashButton: FlashButton? = nil
    
    private lazy var flashButton: FlashButton = {
       let button = FlashButton()
//        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Сканировать QR код"
        let qrScannerView = QRScannerView(frame: view.bounds)
        view.addSubview(qrScannerView)
        qrScannerView.configure(delegate: self)
        qrScannerView.startRunning()
        
//        flashButton?.addTarget(self, action: #selector(tapped), for: .touchUpInside)
//        qrScannerView.configure(delegate: self, input: .init(isBlurEffectEnabled: true))
        
//        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
//    @objc func tapped(_ sender: UIButton) {
//        let qrScannerView = QRScannerView(frame: view.bounds)
//        qrScannerView.setTorchActive(isOn: !sender.isSelected)
//    }
    // MARK: - Setup
    
    private func setupView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubview(flashButton)
    }
    
    private func configureConstraints() {
        flashButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-100)
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
}

// MARK: - Extensions

extension ScanQRViewController: ScanQRView {
}

extension ScanQRViewController: QRScannerViewDelegate {
    func qrScannerView(_ qrScannerView: QRScannerView, didFailure error: QRScannerError) {
        print(error)
    }

    func qrScannerView(_ qrScannerView: QRScannerView, didSuccess code: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
//    func qrScannerView(_ qrScannerView: QRScannerView, didChangeTorchActive isOn: Bool) {
//        flashButton.isSelected = isOn
//    }
}

// MARK: - Nested types

private extension ScanQRViewController {
    
    enum Constants {
    }
    
}


final class FlashButton: UIButton {
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        settings()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        settings()
    }

    // MARK: - Properties
    override var isSelected: Bool {
        didSet {
            let color: UIColor = isSelected ? .gray : .lightGray
            backgroundColor = color.withAlphaComponent(0.7)
        }
    }
}

// MARK: - Private
private extension FlashButton {
    func settings() {
        setTitleColor(.darkGray, for: .normal)
        setTitleColor(.white, for: .selected)
        setTitle("OFF", for: .normal)
        setTitle("ON", for: .selected)
        tintColor = .clear
        titleLabel?.font = .boldSystemFont(ofSize: 16)
        layer.cornerRadius = frame.size.width / 2
        isSelected = false
    }
}
