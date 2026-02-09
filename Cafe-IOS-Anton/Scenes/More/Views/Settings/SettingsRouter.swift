//
//  SettingsRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//


import UIKit

protocol SettingsRouterProtocol {
   
}

class SettingsRouter: SettingsRouterProtocol {
    var rootViewController: SettingsViewController
    
    init(rootViewController: SettingsViewController) {
        self.rootViewController = rootViewController
    }
    
    static func createModule() -> UIViewController {
        let view = SettingsViewController()
        let router = SettingsRouter(rootViewController: view)
        let interactor = SettingsInteractor()
        let presenter = SettingsPresenter(input: view, interactor: interactor)
        return view
    }
}
