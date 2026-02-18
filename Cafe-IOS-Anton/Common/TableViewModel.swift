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
    // must be static
    let identifier: String
    
    var height: CGFloat {
        return UITableView.automaticDimension
    }
    
    init(objectId: String, identifier: String = UUID().uuidString) {
        self.identifier = identifier
        self.objectId = objectId
    }
    

}
