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
        let presenter = OrdersPresenter(input: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        view.router = router

        return view
    }
    
    func showActualOrders() {
        let vc = ActualOrdersRouter.createModule()
        rootViewController.addContainerView(vc)
    }

    func showСompletedOrders() {
        let vc = CompletedOrdersRouter.createModule()
        rootViewController.addContainerView(vc)
    }
}
