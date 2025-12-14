//
//  ProfilePresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation
import UIKit

protocol ProfilePresenterProtocol {
    
}

class ProfilePresenter: TablePresenter, ProfilePresenterProtocol {
    var viewController: ProfileViewControllerProtocol
    
    init(viewController: ProfileViewControllerProtocol) {
        self.viewController = viewController
    }
}
