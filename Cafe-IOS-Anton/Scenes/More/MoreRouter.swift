//
// MoreRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol MoreRouterProtocol {
    var rootViewController: UINavigationController { get set }
}

class MoreRouter: MoreRouterProtocol {
    var rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    static func createModule() -> UIViewController {
        let view = MoreViewController()
        
        let navController = UINavigationController(rootViewController: view)
        
        return navController
    }
}
