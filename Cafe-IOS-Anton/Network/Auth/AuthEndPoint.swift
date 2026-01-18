//
//  AuthEndPoint.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 18.01.2026.
//

import Foundation

enum AuthEndPoint {
    
}

extension AuthEndPoint: Endpoint {
    
    var requestEndpoint: String {
        ""
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    
}
