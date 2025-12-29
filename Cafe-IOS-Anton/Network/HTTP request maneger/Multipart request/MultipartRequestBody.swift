//
//  MultipartRequestBody.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 27.12.2025.
//

import Foundation

public protocol DataConvertible {
    func getData() throws -> Data
}

extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}

class MultipartRequestBody: DataConvertible {
    private let boundary: MultipartRequestBoundary
    private let parts: [MultipartRequestPartType?]
    
    init(withBoundary boundary: MultipartRequestBoundary, parts: [MultipartRequestPartType?]) {
        self.boundary = boundary
        self.parts = parts
    }
    
    func getData() throws -> Data {
        let body = NSMutableData()
        parts.forEach { part in
            body.appendString(boundary.stringWithDelimiter + "\r\n")
            if let data = part?.partData {
                body.append(data)
            }
        }
        body.appendString(boundary.stringWithDelimiter + "--\r\n")
        return body as Data
    }
}
