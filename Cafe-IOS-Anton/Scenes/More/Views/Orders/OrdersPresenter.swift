//
//  OrdersPresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//

import Foundation
import UIKit

protocol OrdersPresenterProtocol {
    
}

class OrdersPresenter: TablePresenter, OrdersPresenterProtocol {
    var input: OrdersViewController
    private var interactor: OrdersInteractorProtocol
    let router: OrdersRouter
    
    init(input: OrdersViewController, interactor: OrdersInteractorProtocol, router: OrdersRouter) {
        self.input = input
        self.interactor = interactor
        self.router = router
        
        super.init()
        self.view = input
    }
    
    func showActualOrders() {
        router.showActualOrders()
    }
    
    func showСompletedOrders() {
        router.showСompletedOrders()
    }
}
