//
//  RootRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 13.12.2025.
//

import UIKit


class RootRouter {
    
    let tabBarController: CustomTabBarController
    
    init() {
        self.tabBarController = CustomTabBarController()
    }
    
    func start() {
        let chatsViewController = makeChatsScreenModule(title: "Чаты", imageName: "chats")
        let cartViewController = makeCartScreenModule(title: "Корзина", imageName: "cart")
        let categoryViewController = makeCategoryScreenModule(title: "Категории", imageName: "")
        let profileViewController = makeProfileScreenModule(title: "Профиль", imageName: "")
        let mainViewController = makeMainScreenModule(title: "Меню", imageName: "")
    }
    
    func makeChatsScreenModule(title: String, imageName: String) -> ChatsRouterProtocol {
        let viewController = ChatsViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let presenter = ChatsPresenter(viewController: viewController)
        let router = ChatsRouter(rootViewController: navigationController)
        let interactor = ChatsInteractor(presenter: presenter, router: router)
        viewController.interactor = interactor
        
        viewController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(named: imageName),
            tag: 0
        )
        
        return router
    }
    
    func makeMainScreenModule(title: String, imageName: String) -> MainRouterProtocol {
        let viewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let presenter = MainPresenter(viewController: viewController)
        let router = MainRouter(rootViewController: navigationController)
        let interactor = MainInteractor(presenter: presenter, router: router)
        viewController.interactor = interactor
        
        viewController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(named: imageName),
            tag: 0
        )
        
        return router
    }
    
    func makeCategoryScreenModule(title: String, imageName: String) -> CategoryRouterProtocol {
        let viewController = CategoryViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let presenter = CategoryPresenter(viewController: viewController)
        let router = CategoryRouter(rootViewController: navigationController)
        let interactor = CategoryInteractor(presenter: presenter, router: router)
        viewController.interactor = interactor
        
        viewController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(named: imageName),
            tag: 0
        )
        
        return router
    }
    
    func makeCartScreenModule(title: String, imageName: String) -> CartRouterProtocol {
        let viewController = CartViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let presenter = CartPresenter(viewController: viewController)
        let router = CartRouter(rootViewController: navigationController)
        let interactor = CartInteractor(presenter: presenter, router: router)
        viewController.interactor = interactor
        
        viewController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: imageName),
            tag: 0
        )
        
        return router
    }
    
    func makeProfileScreenModule(title: String, imageName: String) -> ProfileRouterProtocol {
        let viewController = ProfileViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let presenter = ProfilePresenter(viewController: viewController)
        let router = ProfileRouter(rootViewController: navigationController)
        let interactor = ProfileInteractor(presenter: presenter, router: router)
        viewController.interactor = interactor
        
        viewController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(named: imageName),
            tag: 0
        )
        
        return router
    }
}


