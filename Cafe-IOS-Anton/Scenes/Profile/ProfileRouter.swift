//
//  ProfileRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol ProfileRouterProtocol {
    var rootViewController: UINavigationController { get set }
}

class ProfileRouter: ProfileRouterProtocol {
    var rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
}
