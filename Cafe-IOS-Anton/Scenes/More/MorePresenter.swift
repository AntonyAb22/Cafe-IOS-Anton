//
//  MorePresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation
import UIKit

protocol MorePresenterProtocol {
    
}

class MorePresenter: TablePresenter, MorePresenterProtocol {
    var viewController: MoreViewControllerProtocol
    
    init(viewController: MoreViewControllerProtocol) {
        self.viewController = viewController
    }
}
