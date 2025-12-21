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
        let categoryViewController = makeCategoryScreenModule(title: "Категории", imageName: "category")
        let mainViewController = MainRouter.createModule()
        let cartViewController = makeCartScreenModule(title: "Корзина", imageName: "cart")
        let profileViewController = makeProfileScreenModule(title: "Профиль", imageName: "person.crop.circle.fill")
        
        tabBarController.viewControllers = [
            chatsViewController.rootViewController,
            categoryViewController,
            mainViewController,
            cartViewController,
            profileViewController
        ]
        
        chatsViewController.rootViewController.tabBarItem.isEnabled = false
        
        // Установить активной вкладкой main
        tabBarController.selectedIndex = 2
        
        configureTabBarAppearance()
        showLogin()
        
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
    
    func makeCategoryScreenModule(title: String, imageName: String) -> UIViewController {
        let categoryViewController = CategoryRouter.createModule()
    
        categoryViewController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(named: imageName),
            tag: 1
        )
        
        return categoryViewController
    }
    
    func makeCartScreenModule(title: String, imageName: String) -> UIViewController {
        let cartViewController = CartRouter.createModule()
        
        cartViewController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: imageName),
            tag: 3
        )
        
        return cartViewController
    }
    
    func makeProfileScreenModule(title: String, imageName: String) -> UIViewController {
//        let profileRouter = ProfileRouter(rootViewController: ProfileViewController())
        let profileViewController = ProfileRouter.createModule()
        
        profileViewController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: imageName),
            tag: 4
        )
//        return ???
        return profileViewController
    }
    
    private func showLogin() {
        let authViewController = AuthViewController()
        let navController = UINavigationController(rootViewController: authViewController)
        let authPresenter = AuthPresenter(viewController: authViewController)
        let authRouter = AuthRouter(viewController: navController)
        let authInteractor = AuthInteractor(presenter: authPresenter, router: authRouter) // не хватает сервиса
        
    }
}

extension RootRouter {
    private func configureTabBarAppearance() {
        tabBarController.tabBar.clipsToBounds = true
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        tabBarController.tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBarController.tabBar.scrollEdgeAppearance = appearance
        }
        
        // Добавление тени сверху таббара
        tabBarController.tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBarController.tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
        tabBarController.tabBar.layer.shadowOpacity = 0.3
        tabBarController.tabBar.layer.shadowRadius = 4
        
        let fontAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "SF Pro Display", size: 10) ?? UIFont.systemFont(ofSize: 10),
            .foregroundColor: UIColor(red: 144/255.0, green: 164/255.0, blue: 174/255.0, alpha: 1.0)
        ]
        
        for viewController in tabBarController.viewControllers ?? [] {
            if let tabBarItem = viewController.tabBarItem {
                tabBarItem.setTitleTextAttributes(fontAttributes, for: .normal)
            }
        }
    }
}
