//
//  MainRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol MainRouterProtocol {
  
}

class MainRouter: MainRouterProtocol {
    var rootViewController: MainViewController
        
    init(rootViewController: MainViewController) {
        self.rootViewController = rootViewController
    }
    
    static func createModule() -> UIViewController {
        let view = MainViewController()
        
        let authService = AuthService()
       
        let router = MainRouter(rootViewController: view)
        let interactor = MainInteractor(authService: authService)
        let presenter = MainPresenter(input: view,
                                         router: router,
                                         interactor: interactor)
        
        view.presenter = presenter
        view.router = router
        let navController = UINavigationController(rootViewController: view)
        
        return navController
    }
}
