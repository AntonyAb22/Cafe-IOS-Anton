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
    var input: ProfileViewController
    private var interactor: ProfileInteractorProtocol
    
    init(input: ProfileViewController, interactor: ProfileInteractorProtocol) {
        self.input = input
        self.interactor = interactor
        
        super.init()
        self.view = input
    }
}
