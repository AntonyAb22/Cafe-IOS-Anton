//
//  SceneDelegate.swift
//  Cafe-ios
//
//  Created by Антон Абалуев on 29.11.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        // Создаем корневой контроллер
//        let rootViewController = AuthViewController()
//
//        // Получаем объект окна из сцены
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//
//        // Создаем новое окно с использованием размеров сцены
//        let window = UIWindow(windowScene: windowScene)
//        window.rootViewController = rootViewController
//
//        // Устанавливаем новое окно как основное для сцены
//        self.window = window
//        window.makeKeyAndVisible()
//
//    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Устанавливаем светлую тему для всего приложения
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let router = RootRouter()
        
        window.rootViewController = router.tabBarController
        self.window = window
        window.makeKeyAndVisible()
        router.start()
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }
}
