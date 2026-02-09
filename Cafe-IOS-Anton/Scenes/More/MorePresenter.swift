//
//  MorePresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation
import UIKit

protocol MorePresenterProtocol {
    func presentProfile()
    func presentMyOrders()
    func presentSupport()
    func presentPrivacy()
    func presentSettings()
}

class MorePresenter: TablePresenter, MorePresenterProtocol {
    var input: MoreViewController
    private var router: MoreRouterProtocol
    private var interactor: MoreInteractorProtocol
    
    init(input: MoreViewController, router: MoreRouterProtocol, interactor: MoreInteractorProtocol) {
        self.input = input
        self.router = router
        self.interactor = interactor
        
        super.init()
        self.view = input
    }
    
    func presentProfile() {
        router.presentProfile()
    }
    
    func presentMyOrders() {
        router.presentMyOrders()
    }
    
    func presentSupport() {
        router.presentSupport()
    }
    
    func presentPrivacy() {
        router.presentPrivacy()
    }
    
    func presentSettings() {
        router.presentSettings()
    }
}
