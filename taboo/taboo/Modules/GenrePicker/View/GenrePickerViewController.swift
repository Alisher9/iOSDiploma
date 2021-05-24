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
import iProgressHUD

final class GenrePickerViewController: BaseViewController, iProgressHUDDelegete {
    
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
    var interactor: GenrePickerInteractor?
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
        let iprogress: iProgressHUD = iProgressHUD()
        iprogress.indicatorStyle = .ballClipRotateMultiple
        // Set the delegete
        iprogress.delegete = self
        
        // Attach iProgressHUD to views
        iprogress.attachProgress(toViews: view)
        
        iProgressHUD.sharedInstance().attachProgress(toView: self.view)
        // Show iProgressHUD directly from view
        self.view.showProgress()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.view.dismissProgress()
            self.presenter?.didTapGenres(genres: self.genresList)
        }
        
    }
    
    func onShow(view: UIView) {
        print("onShow")
        
    }
    
    func onDismiss(view: UIView) {
        print("onStop")
    }
    
    func onTouch(view: UIView) {
        print("onTouch")
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
        print("didSelect -> \(node.text)")
        genresList.append(node.label.text ?? "")
        print("/// list", genresList)
        
    }
    
    func magnetic(_ magnetic: Magnetic,
                  didDeselect node: Node) {
        print("didDeselect -> \(node.label.text ?? "")")
        print("/// after deleting", genresList)
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
