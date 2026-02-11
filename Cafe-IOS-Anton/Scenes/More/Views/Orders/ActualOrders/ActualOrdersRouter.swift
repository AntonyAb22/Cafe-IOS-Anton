//
//  ActualOrdersRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//


import UIKit

protocol ActualOrdersRouterProtocol {
   
}

class ActualOrdersRouter: ActualOrdersRouterProtocol {
    var rootViewController: ActualOrdersViewController
    
    init(rootViewController: ActualOrdersViewController) {
        self.rootViewController = rootViewController
    }
    
    static func createModule() -> UIViewController {
        let view = ActualOrdersViewController()
        let router = ActualOrdersRouter(rootViewController: view)
        let interactor = ActualOrdersInteractor()
        let presenter = ActualOrdersPresenter(input: view, interactor: interactor)
        return view
    }
}
