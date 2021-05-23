//
//  UITableViewExtension.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/15/21.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            assertionFailure("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
            return T()
        }
        return cell
    }
    
    func reloadDataAnimated() {
        let range = NSRange(location: 0, length: numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        reloadSections(sections as IndexSet, with: .automatic)
    }
    
}

extension UITableViewCell: ReusableView {}
