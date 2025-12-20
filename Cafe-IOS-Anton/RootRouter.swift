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
//        let mainViewController = makeMainScreenModule(title: "Главная", imageName: "")
        let mainViewController = MainRouter.createModule()
        let categoryViewController = makeCategoryScreenModule(title: "Категории", imageName: "category")
        let profileViewController = makeProfileScreenModule(title: "Профиль", imageName: "person.crop.circle.fill")
        
        tabBarController.viewControllers = [
            chatsViewController.rootViewController,
//            cartViewController,
            mainViewController,
            profileViewController
        ]
        
        chatsViewController.rootViewController.tabBarItem.isEnabled = false
        
        // Установить активной вкладкой projectsViewController
        tabBarController.selectedIndex = 1
        
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
//    
//    func makeMainScreenModule(title: String, imageName: String) -> MainRouterProtocol {
//        let viewController = MainViewController()
//        let navigationController = UINavigationController(rootViewController: viewController)
//        let presenter = MainPresenter(viewController: viewController)
//        let router = MainRouter(rootViewController: navigationController)
//        let interactor = MainInteractor(presenter: presenter, router: router)
//        viewController.interactor = interactor
//        
//        viewController.tabBarItem = UITabBarItem(
//            title: title,
//            image: UIImage(named: imageName),
//            tag: 1
//        )
//        
//        return router
//    }
    
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
            tag: 2
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
            tag: 3
        )
        
        return router
    }
    
    func makeProfileScreenModule(title: String, imageName: String) -> UIViewController {
//        let profileRouter = ProfileRouter(rootViewController: ProfileViewController())
        let profileViewController = ProfileRouter.createModule()
        
        profileViewController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(named: imageName),
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
