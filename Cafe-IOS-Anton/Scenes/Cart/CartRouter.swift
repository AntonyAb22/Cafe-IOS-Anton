//
//  CartRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol CartRouterProtocol {
    var rootViewController: UINavigationController { get set }
}

class CartRouter: CartRouterProtocol {
    var rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    static func createModule() -> UIViewController {
        let view = CartViewController()
        
        let navController = UINavigationController(rootViewController: view)
        
        return navController
    }
}
