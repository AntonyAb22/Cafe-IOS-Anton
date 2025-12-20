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
    
    //let authService: AuthServiceProtocol
    //let authService2 = AuthService2()
    let presenter: AuthPresenterProtocol
    let router: AuthRouterProtocol
    var model: AuthInteractorModel = .initial
    
    init(
//        authService: AuthServiceProtocol,
        presenter: AuthPresenterProtocol,
        router: AuthRouterProtocol,
    ) {
        //self.authService = authService
        self.presenter = presenter
        self.router = router
    }
    
    
    func login() {
        print(#function)
        // проверка кредов
        self.router.navigateToHome(
            with: .init(
                id: "какой-то id",
                userName: "какое-то имя пользователя",
                email: "какой-то имейл"
            )
        )
    }
    
    func passwordDidtap(text: String) {
        model.password = text
    }
    
    func loginDidtap(text: String) {
        model.login = text
    }
}
