//
//  AuthToken.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 18.01.2026.
//

import Foundation

struct AuthToken: Codable {
    let token: String
    let code: Int
    let expired: String
}

extension AuthToken: DataInstantiable {
    
    init(with data: Data) throws {
        self = try JSONDecoder().decode(AuthToken.self, from: data)
    }
}

extension AuthToken {
    func getUserId() -> String? {
        let parts = token.split(separator: ".")
        guard parts.count == 3 else {
            return nil
        }
        let payload = parts[1]
        var base64 = String(payload)
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "-", with: "/")
        while base64.count % 4 != 0 {
            base64.append("=")
        }
        guard let data = Data(base64Encoded: base64, options: .ignoreUnknownCharacters) else {
            return nil
        }
        guard let decoded = String(data: data, encoding: .utf8) else {
            return nil
        }
        let jsonData = decoded.data(using: .utf8)
        do {
            let userId = try JSONDecoder().decode(JWT.self, from: jsonData!).userId
            return userId
        } catch {
            return nil
        }
    }
    
    private struct JWT: Decodable {
        let userId: String
        
        private enum CodingKeys: String, CodingKey {
            case userId = "user_id"
        }
    }
}
