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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var magneticView: MagneticView! {
        didSet {
            magnetic.magneticDelegate = self
            magnetic.removeNodeOnLongPress = true
            magnetic.allowsMultipleSelection = true
        }
    }
    
    var genresList = [String]()
    
    var presenter: GenrePickerPresentation?
//    var rootModuleBuilder: RootModuleBuilder?
    
    var magnetic: Magnetic {
        return magneticView.magnetic
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        magneticNodes()
        titleLabel.text = L10n.GenrePicker.title
        descriptionLabel.text = L10n.GenrePicker.description
    }
    @IBAction func nextTapped(_ sender: Any) {
        title = L10n.GenrePicker.button
//        rootModuleBuilder?.setupRootController(animated: true)
        presenter?.didTapOnNextButton(genres: genresList)
    }
    
    private func magneticNodes() {
        let name = UIImage.names
        for item in name {
            let color = UIColor.colors.randomItem()
            let node = Node(text: item,
                            image: Asset.favorite.image,
                            color: color,
                            radius: 40)
            node.scaleToFitContent = true
            node.selectedColor = UIColor.colors.randomItem()
            magnetic.addChild(node)
        }
    }
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
        genresList.append(node.description)
        print("/// list", genresList)
        
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
