//
//  ProfileViewController.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol ProfileViewControllerProtocol: AnyObject {

}

class ProfileViewController: UIViewController, ProfileViewControllerProtocol  {
    var interactor: ProfileInteractorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
