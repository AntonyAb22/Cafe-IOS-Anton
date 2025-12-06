//
//  ForgotPresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

protocol ForgotPresenterProtocol {
    
}

class ForgotPresenter: ForgotPresenterProtocol {
    let view: ForgotViewController
    let interactor: ForgotInteractor
    let router: ForgotRouter
    
    init(view: ForgotViewController, interactor: ForgotInteractor, router: ForgotRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func resetPassword(email: String) {
        
    }
}
