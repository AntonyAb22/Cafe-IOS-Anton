//
//  PrivacyRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//


import UIKit

protocol PrivacyRouterProtocol {
   
}

class PrivacyRouter: PrivacyRouterProtocol {
    var rootViewController: PrivacyViewController
    
    init(rootViewController: PrivacyViewController) {
        self.rootViewController = rootViewController
    }
    
    static func createModule() -> UIViewController {
        let view = PrivacyViewController()
        let router = PrivacyRouter(rootViewController: view)
        let interactor = PrivacyInteractor()
        let presenter = PrivacyPresenter(input: view, interactor: interactor)
        return view
    }
}
