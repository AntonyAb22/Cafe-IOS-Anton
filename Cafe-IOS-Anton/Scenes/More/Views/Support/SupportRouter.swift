//
//  SupportRouter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//

import UIKit

protocol  SupportRouterProtocol {
   
}

class  SupportRouter:  SupportRouterProtocol {
    var rootViewController:  SupportViewController
    
    init(rootViewController:  SupportViewController) {
        self.rootViewController = rootViewController
    }
    
    static func createModule() -> UIViewController {
        let view =  SupportViewController()
        let router =  SupportRouter(rootViewController: view)
        let interactor =  SupportInteractor()
        let presenter =  SupportPresenter(input: view, interactor: interactor)
        return view
    }
}
