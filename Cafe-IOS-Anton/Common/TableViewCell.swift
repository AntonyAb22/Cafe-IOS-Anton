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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCommonProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupCommonProperties()
    }
    
    private func setupCommonProperties() {
        selectionStyle = .none
    }
    
    func fill(_ tableViewModel: TableViewModel?) {
    }
    
    func notify(actionIdentifier: String, data: Any? = nil) {
        let action = CellAction(
            cellIdentifier: model?.identifier ?? "",
            identifier: actionIdentifier,
            data: data)
        handler?(action, self)
    }
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
