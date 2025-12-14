//
//  ProfileInteractor.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation
import UIKit

protocol ProfileInteractorProtocol {
    
}

class ProfileInteractor: ProfileInteractorProtocol {
    var presenter: ProfilePresenterProtocol
    var router: ProfileRouterProtocol
    
    init(presenter: ProfilePresenterProtocol, router: ProfileRouterProtocol) {
        self.presenter = presenter
        self.router = router
    }
}
