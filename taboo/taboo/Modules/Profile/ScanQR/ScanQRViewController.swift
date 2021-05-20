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

        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

    // MARK: - Setup
    
    private func setupView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
    }
    
    private func configureConstraints() {
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.navigationController?.popViewController(animated: true)
            self.presenter?.didTapReset()
        }
    }
}

// MARK: - Nested types

private extension ScanQRViewController {
    
    enum Constants {
    }
    
}
