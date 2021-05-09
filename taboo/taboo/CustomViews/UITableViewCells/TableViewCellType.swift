//
//  TableViewCellType.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/7/21.
//

import UIKit

enum TableViewCellType {
    case button(title: String)
    case info(title: String)
    case label(title: String, style: TableViewLabelCellStyle)
    case textField(style: MainTextFieldStyle,
                   placeholder: String,
                   key: String,
                   editable: Bool,
                   fontStyle: UIFont,
                   textColor: UIColor)
    
    func cell(forTableView tableView: UITableView, forRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self {
        case .button(let title):
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TableViewButtonCell
            cell.configure(title: title)
            return cell
        case .info(title: let title):
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TableViewInfoCell
            cell.title = title
            return cell
        case .label(let title, let style):
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TableViewLabelCell
            cell.title = title
            cell.configure(style)
            return cell
        case .textField(let style,
                        let placeholder,
                        let key,
                        let editable,
                        let fontStyle,
                        let textColor):
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TableViewTextFieldCell
            cell.configure(style: style,
                           placeholder: placeholder,
                           key: key,
                           editable: editable,
                           fontStyle: fontStyle,
                           textColor: textColor)
            return cell
        }
    }
}
