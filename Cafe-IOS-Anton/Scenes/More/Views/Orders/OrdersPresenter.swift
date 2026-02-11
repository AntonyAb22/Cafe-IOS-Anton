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
    
    init(input: OrdersViewController, interactor: OrdersInteractorProtocol) {
        self.input = input
        self.interactor = interactor
        
        super.init()
        self.view = input
    }
    
    func showActualOrders() {
        
    }
    
    func showСompletedOrders() {
        
    }
}
