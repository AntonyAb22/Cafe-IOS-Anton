//
//  AuthInteractor.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 30.11.2025.
//

import Foundation
import UIKit


// всё что нужно сохранить в моменте для экрана
struct AuthInteractorModel {
    var login: String
    var password: String
    static let initial: AuthInteractorModel = .init(login: "", password: "")
}

protocol AuthInteractorProtocol {
    func login()
    func passwordDidtap(text: String)
    func loginDidtap(text: String)
}

class AuthInteractor: AuthInteractorProtocol {
    
    let presenter: AuthPresenterProtocol
    let router: AuthRouterProtocol
    var model: AuthInteractorModel = .initial
    
    let authService: AuthServiceProtocol
    
    init(
        authService: AuthServiceProtocol,
        presenter: AuthPresenterProtocol,
        router: AuthRouterProtocol,
    ) {
        self.authService = authService
        self.presenter = presenter
        self.router = router
    }
    
    
    func login() {
        print(#function)
        authService.login(login: model.login, password: model.password) { token, error in
            if let token = token {
                token.saveToKeychain()
                print("Debug:// запрос прошел успешно")
                
                // проверка кредов
                self.router.navigateToHome(
                    with: .init(
                        id: "какой-то id",
                        userName: "какое-то имя пользователя",
                        email: "какой-то имейл",
                        phoneNumber: "+7905",
                        password: "1234"
                    )
                )
            } else {
                DispatchQueue.main.async {
                    self.presenter.presentError()
                }
            }
            
        }
    }
    
    func passwordDidtap(text: String) {
        model.password = text
    }
    
    func loginDidtap(text: String) {
        model.login = text
    }
}
