//
//  Serializer.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 27.12.2025.
//

import Foundation

class Serializer {
    open func serialize<Y: Codable>(type: Y.Type, from data: Data?) throws -> Y? {
        guard let data = data else { return nil }
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(type, from: data)
            return result
        }
    }
}
