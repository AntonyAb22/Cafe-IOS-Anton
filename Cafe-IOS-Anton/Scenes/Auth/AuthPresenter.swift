//
//  AuthPresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 30.11.2025.
//

import Foundation


protocol AuthPresenterProtocol {
    
    // показать ошибку авторизации
    func presentError()
}

class AuthPresenter: AuthPresenterProtocol {
    
    weak var viewController: AuthViewController!
    
    init(viewController: AuthViewController!) {
        self.viewController = viewController
    }
    
    func presentError() {
        viewController.showAuthtorisationError()
    }
}
