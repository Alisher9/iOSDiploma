//
//  GenerateQRViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/18/21.
//  
//

import UIKit

final class GenerateQRViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var presenter: GenerateQRPresentation?
    private let api = "Alisher"
    
    // MARK: - Private properties
    
    private lazy var qrImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.magnificationFilter = CALayerContentsFilter.nearest
        return image
    }()
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Мой QR код"
        qrImage.image = generateQR(api: api)
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
        view.addSubview(qrImage)
    }
    
    private func configureConstraints() {
        qrImage.snp.makeConstraints {
            $0.width.height.equalTo(300)
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Public actions
    private func generateQR(api: String) -> UIImage {
        let nameData = api.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(nameData, forKey: "inputMessage")
            
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        return UIImage()
    }
    // MARK: - Private actions
    
}

// MARK: - Extensions

extension GenerateQRViewController: GenerateQRView {
}

// MARK: - Nested types

private extension GenerateQRViewController {
    
    enum Constants {
    }
    
}
