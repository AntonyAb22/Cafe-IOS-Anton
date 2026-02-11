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
        let interactor = CompletedOrdersInteractor()
        let presenter = CompletedOrdersPresenter(input: view, interactor: interactor)
        return view
    }
}
