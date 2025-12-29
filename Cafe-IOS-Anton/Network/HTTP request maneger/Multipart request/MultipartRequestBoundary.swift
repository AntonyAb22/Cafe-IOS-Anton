//
//  MultipartRequestBoundary.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 27.12.2025.
//

import Foundation

struct MultipartRequestBoundary {
    
    static public let shared = MultipartRequestBoundary()
    static private let uuidString = UUID().uuidString
    
    public var httpHeaderContentType: String {
        "multipart/form-data; boundary=\(string)"

    }
    
    public var string: String {
        "Boundary-\(MultipartRequestBoundary.uuidString)"
    }
    
    public var stringWithDelimiter: String {
        "--\(string)"
    }
}
