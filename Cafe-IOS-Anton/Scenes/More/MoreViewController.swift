//
//  MoreViewController.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol MoreViewControllerProtocol: AnyObject {

}

class MoreViewController: TableView  {
    var interactor: MoreInteractorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}
