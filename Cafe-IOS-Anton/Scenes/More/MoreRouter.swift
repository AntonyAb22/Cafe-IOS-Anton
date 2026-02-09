//
// MoreRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol MoreRouterProtocol {
    var rootViewController: UINavigationController { get set }
    func presentProfile()
    func presentMyOrders()
    func presentSupport()
    func presentPrivacy()
    func presentSettings()
}

class MoreRouter: MoreRouterProtocol {
    
    var rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    static func createModule() -> UIViewController {
        let view = MoreViewController()
        let interactor = MoreInteractor()
        
        let navController = UINavigationController(rootViewController: view)
        let router = MoreRouter(rootViewController: navController)
        
        let presenter = MorePresenter(
            input: view,
            router: router,
            interactor: interactor
        )
        
        view.presenter = presenter
        
        return navController
    }
    
    func presentProfile() {
        let profileViewController = ProfileRouter.createModule()
        rootViewController.pushViewController(profileViewController, animated: true)
    }
    
    func presentMyOrders() {
        let ordersViewController = OrdersRouter.createModule()
        rootViewController.pushViewController(ordersViewController, animated: true)
    }
    
    func presentSupport() {
        let supportViewController = SupportRouter.createModule()
        rootViewController.pushViewController(supportViewController, animated: true)
    }
    
    func presentPrivacy() {
        let privacyViewController = PrivacyRouter.createModule()
        rootViewController.pushViewController(privacyViewController, animated: true)
    }
    
    func presentSettings() {
        let settingsViewController = SettingsRouter.createModule()
        rootViewController.pushViewController(settingsViewController, animated: true)
    }
    
    func logout() {
        
    }
}
