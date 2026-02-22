//
//  CompletedOrdersPresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//

import Foundation
import UIKit

protocol CompletedOrdersPresenterProtocol {
    
}

class CompletedOrdersPresenter: TablePresenter, CompletedOrdersPresenterProtocol {
    var input: CompletedOrdersViewController
    private var interactor: CompletedOrdersInteractorProtocol
    var router: CompletedOrdersRouter
    private var orders = [Order]()
    
    init(input: CompletedOrdersViewController, interactor: CompletedOrdersInteractorProtocol, router: CompletedOrdersRouter) {
        self.input = input
        self.interactor = interactor
        self.router = router
        
        super.init()
        self.view = input
    }
    
    func loadCompletedOrders() {
        interactor.loadCompletedOrders { orders, error in
            if let error = error {
                print("Ошибка загрузки получения заказов: ", error.localizedDescription)
            }
            
            if let orders = orders {
                self.orders = orders
            }
            self.fillCompletedOrdersItem()
        }
    }
    
    func fillCompletedOrdersItem() {
        items.removeAll()
        var completedOrdersViewModels = [OrderViewModel]()
        for order in orders {
            let completedOrdersViewModel = OrderViewModel(time: order.time, price: order.totalPrice, cakeName: order.cakeName, deliveryDate: order.deliveryDate, address: order.address, id: order.id, objectId: order.id)
            completedOrdersViewModels.append(completedOrdersViewModel)
        }
        for completedOrdersViewModel in completedOrdersViewModels {
            let item = TableViewItem(cell: CompletedOrdersTableViewCell.self, model: completedOrdersViewModel)
            self.items.append(item)
            self.register(item: item)
        }
        print("Кол-во элементов: \(self.items.count)")
        self.input.reloadData()
    }
    
    func removeItem(atIndex index: Int) {
        items.remove(at: index) // удаление ячейки
    }

    func selectItem(atIndex index: Int) {
        
    }
}
