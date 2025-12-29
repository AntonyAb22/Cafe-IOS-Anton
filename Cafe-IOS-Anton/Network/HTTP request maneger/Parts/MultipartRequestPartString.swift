//
//  MultipartRequestPartString.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 27.12.2025.
//

import Foundation

public struct MultipartRequestPartString: MultipartRequestPartType {
    
    public let value: String
    
    public var name: String
    
    public var partData: Data {
        let body = NSMutableData()
        body.appendString("Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n")
        body.appendString("\(value)\r\n")
        return body as Data
    }
    
    public init(value: String, name: String) {
        self.value = value
        self.name = name
    }
    
}
