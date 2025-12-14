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
    var viewController: MainViewControllerProtocol
    
    init(viewController: MainViewControllerProtocol) {
        self.viewController = viewController
    }
}
