//
//  CompletedOrdersRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//


import UIKit

protocol CompletedOrdersRouterProtocol {
   
}

class CompletedOrdersRouter: CompletedOrdersRouterProtocol {
    var rootViewController: CompletedOrdersViewController
    
    init(rootViewController: CompletedOrdersViewController) {
        self.rootViewController = rootViewController
    }
    
    static func createModule() -> UIViewController {
        let view = CompletedOrdersViewController()
        let router = CompletedOrdersRouter(rootViewController: view)
        let service = OrdersService()
        let interactor = CompletedOrdersInteractor(service: service)
        let presenter = CompletedOrdersPresenter(input: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
