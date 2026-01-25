//
//  MenuRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol MenuRouterProtocol {
    var rootViewController: UINavigationController { get set }
}

class MenuRouter: MenuRouterProtocol {
    var rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    static func createModule() -> UIViewController {
        let view = MenuViewController()
        
        let navController = UINavigationController(rootViewController: view)
        
        return navController
    }
}
