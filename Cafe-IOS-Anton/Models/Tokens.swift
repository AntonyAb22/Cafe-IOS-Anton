//
//  Tokens.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 22.02.2026.
//

import Foundation

struct Tokens: Codable {
    let access: String
    let refresh: String
}

extension Tokens {
    func saveToKeychain() {
        KeyChain.shared.saveAccessToken(access)
        KeyChain.shared.saveRefreshToken(refresh)
    }
    
    static func loadFromKeychain() -> Tokens? {
        guard let access = KeyChain.shared.getAccessToken(),
              let refresh = KeyChain.shared.getRefreshToken() else {
            return nil
        }
        return Tokens(access: access, refresh: refresh)
    }
}

struct JWTDecoder {
    
    static func getUserId(from accessToken: String) -> String? {
        let parts = accessToken.split(separator: ".")
        guard parts.count == 3 else { return nil }
        
        let payload = String(parts[1])
        
        // Base64URL декодирование
        var base64 = payload
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        
        while base64.count % 4 != 0 {
            base64.append("=")
        }
        
        guard let data = Data(base64Encoded: base64),
              let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let userId = json["user_id"] as? String else {
            return nil
        }
        
        return userId
    }
}
