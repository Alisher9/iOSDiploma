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
        }
    }
    
    var presenter: GenrePickerPresentation?
    var rootModuleBuilder: RootModuleBuilder?
    
    var magnetic: Magnetic? {
        return magneticView?.magnetic
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for _ in 0..<18 {
            magneticNodes()
        }
    }
    @IBAction func nextTapped(_ sender: Any) {
//        rootModuleBuilder.setupRootController(animated: true)
    }
    //
//    @IBAction func add(_ sender: UIControl?) {
//        let name = UIImage.names.randomItem()
//        let color = UIColor.colors.randomItem()
//        let node = Node(text: name.capitalized, image: UIImage(named: name), color: color, radius: 40)
//        node.scaleToFitContent = true
//        node.selectedColor = UIColor.colors.randomItem()
//        magnetic?.addChild(node)
//
//         Image Node: image displayed by default
//         let node1 = ImageNode(text: name.capitalized, image: UIImage(named: name), color: color, radius: 40)
//        magnetic?.addChild(node1)
//    }
    
    // MARK: - Private properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        magneticNodes()
        setupView()
    }
    
    private func magneticNodes() {
        let name = UIImage.names.randomItem()
        let color = UIColor.colors.randomItem()
        let node = Node(text: name,
                        image: UIImage(named: name),
                        color: color,
                        radius: 40)
        node.scaleToFitContent = true
        node.selectedColor = UIColor.colors.randomItem()
        magnetic?.addChild(node)
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

extension GenrePickerViewController: GenrePickerView {
}

// MARK: - Nested types

private extension GenrePickerViewController {
    
    enum Constants {
    }
    
}

extension GenrePickerViewController: MagneticDelegate {
    
    func magnetic(_ magnetic: Magnetic,
                  didSelect node: Node) {
        print("didSelect -> \(node)")
        
    }
    
    func magnetic(_ magnetic: Magnetic,
                  didDeselect node: Node) {
        print("didDeselect -> \(node)")
    }
    
    func magnetic(_ magnetic: Magnetic,
                  didRemove node: Node) {
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
