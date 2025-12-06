//
//  TableViewCell.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol CellHandlerDelegate: AnyObject {
    
}

public typealias CellHandler = (CellAction, TableViewCell) -> Void

public class TableViewCell: UITableViewCell {
    var model: TableViewModel?
    var handler: CellHandler?
}

public class CellAction {
    let cellIdentifier: String
    let identifier: String
    let data: Any?
    
    init(cellIdentifier: String, identifier: String, data: Any? = nil) {
        self.cellIdentifier = cellIdentifier
        self.identifier = identifier
        self.data = data
    }
}
