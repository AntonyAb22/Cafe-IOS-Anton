//
// ProfileRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol ProfileRouterProtocol {
   
}

class ProfileRouter: ProfileRouterProtocol {
    var rootViewController: ProfileViewController
    
    init(rootViewController: ProfileViewController) {
        self.rootViewController = rootViewController
    }
    
    static func createModule() -> UIViewController {
        let view = ProfileViewController()
        let router = ProfileRouter(rootViewController: view)
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(input: view, interactor: interactor)
        return view
    }
}
