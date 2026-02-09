//
//  PrivacyPresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//

import Foundation
import UIKit

protocol PrivacyPresenterProtocol {
    
}

class PrivacyPresenter: TablePresenter, PrivacyPresenterProtocol {
    var input: PrivacyViewController
    private var interactor: PrivacyInteractorProtocol
    
    init(input: PrivacyViewController, interactor: PrivacyInteractorProtocol) {
        self.input = input
        self.interactor = interactor
        
        super.init()
        self.view = input
    }
}
