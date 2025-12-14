//
//  MainInteractor.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation
import UIKit

protocol MainInteractorProtocol {
    
}

class MainInteractor: MainInteractorProtocol {
    var presenter: MainPresenterProtocol
    var router: MainRouterProtocol
    
    init(presenter: MainPresenterProtocol, router: MainRouterProtocol) {
        self.presenter = presenter
        self.router = router
    }
}
