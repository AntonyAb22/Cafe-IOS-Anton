//
//  AuthRooter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 30.11.2025.
//
import UIKit

protocol AuthRouterProtocol {
    func navigateToForgotPassword()
    func navigateToRegistration()
    func navigateToHome(with user: UserAuth)
}

class AuthRouter: AuthRouterProtocol {
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func navigateToHome() {
        
    }
    // переход на экран Забыли пароль?
    func navigateToForgotPassword() {
        let forgotVC = ForgotViewController()
        
        if let navController = viewController?.navigationController {
            navController.pushViewController(forgotVC, animated: true)
        } else {
            let newNavController = UINavigationController(rootViewController: forgotVC)
            newNavController.modalPresentationStyle = .fullScreen
            viewController?.present(newNavController, animated: true)
        }
    }
    
    // переход на экран Регистрации
    func navigateToRegistration() {
        let registrationVC = RegistrationViewController()
        
        if let navController = viewController?.navigationController {
            navController.pushViewController(registrationVC, animated: true)
        } else {
            let newNavController = UINavigationController(rootViewController: registrationVC)
            newNavController.modalPresentationStyle = .fullScreen
            viewController?.present(newNavController, animated: true)
        }
    }
    
    func navigateToHome(with user: UserAuth) {
        DispatchQueue.main.async {
            self.viewController?.dismiss(animated: true)
        }
    }
}


