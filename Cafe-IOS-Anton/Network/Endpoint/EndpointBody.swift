//
//  EndpointBody.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 27.12.2025.
//

import Foundation

public class EndpointBody: DataConvertible {
    
    var boundary: String?
    var parts: [MultipartRequestPartType]?
    private var requestBody: [String: Any]?
    private var requestData: Data?
    
    enum BodyKey: String {
        case array = "ArrayBodyKey"
        case arraySeparator = "__"
    }
    
    init(requestBody: [String: Any]) {
        self.requestBody = requestBody
    }
    
    init(requestData: Data) {
        self.requestData = requestData
    }
    
    init(withBoundary boundary: String, parts: [MultipartRequestPartType]) {
        self.boundary = boundary
        self.parts = parts
    }
    
    public func getData() throws -> Data {
        if let data = requestData {
            return data
        } else {
            do {
                return try JSONSerialization.data(withJSONObject: requestBody as Any, options: [])
            } catch {
                return Data()
            }
        }
    }
    
    private let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
