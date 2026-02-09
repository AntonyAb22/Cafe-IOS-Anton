//
//  SettingsPresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//

import Foundation
import UIKit

protocol SettingsPresenterProtocol {
    
}

class SettingsPresenter: TablePresenter, SettingsPresenterProtocol {
    var input: SettingsViewController
    private var interactor: SettingsInteractorProtocol
    
    init(input: SettingsViewController, interactor: SettingsInteractorProtocol) {
        self.input = input
        self.interactor = interactor
        
        super.init()
        self.view = input
    }
}
