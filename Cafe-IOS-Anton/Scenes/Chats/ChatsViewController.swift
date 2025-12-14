//
//  ChatsViewController.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol ChatsViewControllerProtocol: AnyObject {

}

class ChatsViewController: UIViewController, ChatsViewControllerProtocol {
    var interactor: ChatsInteractorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

