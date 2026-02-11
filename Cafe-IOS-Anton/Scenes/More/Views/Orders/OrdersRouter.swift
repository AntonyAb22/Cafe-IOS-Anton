//
//  OrdersRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//

import UIKit

protocol OrdersRouterProtocol {
   
}

class OrdersRouter: OrdersRouterProtocol {
    var rootViewController: OrdersViewController
    
    init(rootViewController: OrdersViewController) {
        self.rootViewController = rootViewController
    }
    
    static func createModule() -> UIViewController {
        let view = OrdersViewController()
        let router = OrdersRouter(rootViewController: view)
        let interactor = OrdersInteractor()
        let presenter = OrdersPresenter(input: view, interactor: interactor)
        return view
    }
    
    func showActualOrders() {
        
    }
    
    func showСompletedOrders() {
        
    }
}
