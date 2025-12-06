//
//  TableViewModel.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation
import UIKit

class TableViewModel {
    let objectId: String
    let identifier: String
    var height: CGFloat {
        return UITableView.automaticDimension
    }
    
    
    init(objectId: String, identifier: String = UUID().uuidString) {
        self.objectId = objectId
        self.identifier = identifier
    }
}
