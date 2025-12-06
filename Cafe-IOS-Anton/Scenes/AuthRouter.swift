//
//  AuthRooter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 30.11.2025.
//
import UIKit

protocol AuthRouterProtocol {
    func navigateToHome()
    func navigateToForgotPassword()
    func navigateToRegistration()
}

class AuthRouter: AuthRouterProtocol {
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func navigateToHome() {
        
    }
    
    func navigateToForgotPassword() {
        
    }
    
    func navigateToRegistration() {
        
    }
}


