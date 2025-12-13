//
//  RegistrationRooter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 30.11.2025.
//
import UIKit

protocol RegistrationRouterProtocol {

}

class RegistrationRouter: RegistrationRouterProtocol {
    
    var rootViewController: UINavigationController
        
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
   
}


