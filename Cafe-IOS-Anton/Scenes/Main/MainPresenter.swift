//
//  MainPresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation
import UIKit

protocol MainPresenterProtocol {
    
}

class MainPresenter: TablePresenter, MainPresenterProtocol {
    let input: MainViewController
    let router: MainRouterProtocol?
    let interactor: MainInteractor
    
    init(input: MainViewController, router: MainRouterProtocol? = nil, interactor: MainInteractor){
        self.input = input
        self.router = router
        self.interactor = interactor
    }
}
