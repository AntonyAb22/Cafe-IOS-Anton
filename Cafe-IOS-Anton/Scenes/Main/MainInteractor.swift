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
    let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
}
