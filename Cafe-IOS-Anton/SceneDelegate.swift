//
//  SceneDelegate.swift
//  Cafe-ios
//
//  Created by Антон Абалуев on 29.11.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Создаем корневой контроллер
        let rootViewController = AuthViewController()

        // Получаем объект окна из сцены
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Создаем новое окно с использованием размеров сцены
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = rootViewController

        // Устанавливаем новое окно как основное для сцены
        self.window = window
        window.makeKeyAndVisible()

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
