//
//  TableViewCellType.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/7/21.
//

import UIKit

enum TableViewCellType {
    case button(title: String)
    
    func cell(forTableView tableView: UITableView, forRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self {
        case .button(let title):
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TableViewButtonCell
            cell.configure(title: title)
            return cell
        }
    }
}
