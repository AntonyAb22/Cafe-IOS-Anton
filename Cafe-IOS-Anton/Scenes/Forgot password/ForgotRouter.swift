//
//  ForgotRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol ForgotRouterProtocol {
    
}

class ForgotRouter: ForgotRouterProtocol {
    var rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
}
