//
//  SupportPresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//

import Foundation
import UIKit

protocol  SupportPresenterProtocol {
    
}

class  SupportPresenter: TablePresenter,  SupportPresenterProtocol {
    var input:  SupportViewController
    private var interactor:  SupportInteractorProtocol
    
    init(input:  SupportViewController, interactor:  SupportInteractorProtocol) {
        self.input = input
        self.interactor = interactor
        
        super.init()
        self.view = input
    }
}
