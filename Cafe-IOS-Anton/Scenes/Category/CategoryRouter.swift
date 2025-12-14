//
//  CategoryRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol CategoryRouterProtocol {
    var rootViewController: UINavigationController { get set }
}

class CategoryRouter: CategoryRouterProtocol {
    var rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
}
