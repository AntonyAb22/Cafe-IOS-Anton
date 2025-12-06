//
//  TableViewItem.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

class TableViewItem {
    let cell: AnyClass
    let model: TableViewModel
    
    init(cell: AnyClass, model: TableViewModel) {
        self.cell = cell
        self.model = model
    }
}
