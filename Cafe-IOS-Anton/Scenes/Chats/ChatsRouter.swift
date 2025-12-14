//
//  ChatsRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol ChatsRouterProtocol {
    var rootViewController: UINavigationController { get set }
}

class ChatsRouter: ChatsRouterProtocol {
    var rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
}
