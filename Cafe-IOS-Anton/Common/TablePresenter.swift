//
//  TablePresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

class TablePresenter {
    var view: TableView?
    var items: [TableViewItem] = []
    
    func tableCellItem(atIndex index: Int) -> TableViewItem {
        items[index]
    }
    
    func register(item: TableViewItem) {
        view?.tableView?.register(item.cell, forCellReuseIdentifier: item.model.identifier)
    }
    
    func set(items: [TableViewItem]) {
        self.items = items
        for item in items {
            register(item: item)
        }
        reload()
    }
    
    func remove(indexes set: Set<Int>, withAnimation: UITableView.RowAnimation = .automatic) {
        items.remove(atOffsets: IndexSet(set))
        view?.tableView?.deleteRows(at: set.map { IndexPath(item: $0, section: 0) }, with: withAnimation)
    }
    
    func insert(items newItems: [TableViewItem], at index: Int) {
        items.insert(contentsOf: newItems, at: index + 1)
        var indexPaths = [IndexPath]()
        var i = 0
        for item in newItems {
            i += 1
            register(item: item)
            indexPaths.append(.init(row: index + i, section: 0) )
        }
        view?.tableView?.insertRows(at: indexPaths, with: .automatic)
    }
    
    func reload() {
        view?.tableView?.reloadData()
    }
}

extension TablePresenter: CellHandlerDelegate {
    
}
