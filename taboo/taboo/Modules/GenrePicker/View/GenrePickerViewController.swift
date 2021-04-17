//
//  GenrePickerViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/16/21.
//  
//

import UIKit
import Magnetic
import SpriteKit

final class GenrePickerViewController: BaseViewController {
    
    // MARK: - Public properties
    
    @IBOutlet weak var magneticView: MagneticView! {
        didSet {
            magnetic?.magneticDelegate = self
            magnetic?.removeNodeOnLongPress = true
            #if DEBUG
            magneticView?.showsFPS = true
            magneticView?.showsDrawCount = true
            magneticView?.showsQuadCount = true
            magneticView?.showsPhysics = true
            #endif
        }
    }
    
    var presenter: GenrePickerPresentation?
    
    var magnetic: Magnetic? {
        return magneticView?.magnetic
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for _ in 0..<12 {
            add(nil)
        }
    }
    
    @IBAction func add(_ sender: UIControl?) {
        let name = UIImage.names.randomItem()
        let color = UIColor.colors.randomItem()
        let node = Node(text: name.capitalized, image: UIImage(named: name), color: color, radius: 40)
        node.scaleToFitContent = true
        node.selectedColor = UIColor.colors.randomItem()
        magnetic?.addChild(node)
        
        // Image Node: image displayed by default
        // let node = ImageNode(text: name.capitalized, image: UIImage(named: name), color: color, radius: 40)
        // magnetic.addChild(node)
    }
    
    @IBAction func reset(_ sender: UIControl?) {
        magneticView.magnetic.reset()
    }
    
    // MARK: - Private properties
    
    // MARK: - Lifecycle
    
//    private lazy var magneticView: MagneticView = {
//       let view = MagneticView()
//        magnetic.magneticDelegate = self
//        magnetic.removeNodeOnLongPress = true
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let name = UIImage.names.randomItem()
//        let color = UIColor.colors.randomItem()
//        let node = Node(text: name.capitalized, image: UIImage(named: name), color: color, radius: 40)
//        node.scaleToFitContent = true
//        node.selectedColor = UIColor.colors.randomItem()
//        magnetic?.addChild(node)
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
//        view.addSubviews(magneticView)
    }
    
    private func configureConstraints() {
//        magneticView.snp.makeConstraints {
//            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
//            $0.centerX.equalTo(0)
//            $0.centerY.equalTo(0)
//            $0.width.equalTo(100)
//            $0.height.equalTo(100)
//        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
}

// MARK: - Extensions

extension GenrePickerViewController: GenrePickerView {
}

// MARK: - Nested types

private extension GenrePickerViewController {
    
    enum Constants {
    }
    
}

extension GenrePickerViewController: MagneticDelegate {
    
    func magnetic(_ magnetic: Magnetic, didSelect node: Node) {
        print("didSelect -> \(node)")
    }
    
    func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
        print("didDeselect -> \(node)")
    }
    
    func magnetic(_ magnetic: Magnetic, didRemove node: Node) {
        print("didRemove -> \(node)")
    }
    
}

class ImageNode: Node {
    override var image: UIImage? {
        didSet {
            texture = image.map { SKTexture(image: $0) }
        }
    }
    override func selectedAnimation() {}
    override func deselectedAnimation() {}
}
