//
//  AuthService.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation

protocol AuthServiceProtocol {
    
}

class AuthService: NetworkService<AuthEndPoint>, AuthServiceProtocol {
    
    func login(login: String, password: String, completion: @escaping (Tokens?, Error?) -> Void) {
        _ = self.executeRequest(to: AuthEndPoint.login(login: login, password: password), completion: { (resultData: Data?, error) in
            
            let serializer = Serializer()
            do {
                let token = try serializer.serialize(type: Tokens.self, from: resultData)
                completion(token, error)
            } catch {
                completion(nil, error)
            }
        })
    }
    
    func getCurrentUser(completion: @escaping (User?, Error?) -> Void) {
        _ = self.executeRequest(to: AuthEndPoint.getCurrentUser, completion: { (resultData, error) in
            let serializer = Serializer()
            do {
                let user = try serializer.serialize(type: User.self, from: resultData)
                completion(user, error)
            } catch {
                completion(nil, error)
            }
            
        })
    }
    
    func getRefreshToken(completion: @escaping (Tokens?, Error?) -> Void) {
        _ = self.executeRequest(to: AuthEndPoint.getRefreshToken, completion: { (resultData, error) in
            let serializer = Serializer()
            do {
                let token = try serializer.serialize(type: Tokens.self, from: resultData)
                completion(token, error)
            } catch {
                completion(nil, error)
            }
            
        })
    }
    
    func logout(completion: @escaping (Error?) -> Void) {
        do {
            KeyChain.shared.clearTokens()
            completion(nil)
        } catch {
            completion(error)
        }
    }
    
     func isJWTTokenExpired(_ token: String) -> Bool {
            let parts = token.split(separator: ".")
            guard parts.count == 3 else { return true }
            
            let payload = String(parts[1])
            
            var base64 = payload
                .replacingOccurrences(of: "-", with: "+")
                .replacingOccurrences(of: "_", with: "/")
            
            while base64.count % 4 != 0 {
                base64.append("=")
            }
            
            guard let data = Data(base64Encoded: base64),
                  let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let expTimestamp = json["exp"] as? TimeInterval else {
                return true
            }
            
            let expirationDate = Date(timeIntervalSince1970: expTimestamp)
            let isExpired = expirationDate <= Date()
            
            if isExpired {
                print("⏰ Токен истек: \(expirationDate), сейчас: \(Date())")
            }
            
            return isExpired
        }
    
    func isTokenExpired() -> Bool { // проверяем истек ли accessToken
        guard let accessToken = KeyChain.shared.getAccessToken() else {
            return true
        }
        return isJWTTokenExpired(accessToken)
    }
    
    func isRefreshTokenExpired() -> Bool { // проверяем истек ли refreshToken
        guard let refreshToken = KeyChain.shared.getRefreshToken() else {
            return true
        }
        return isJWTTokenExpired(refreshToken)
    }
    
    // автоматическая обработка 401 ошибки
    func handleTokenExpiration(completion: @escaping (Bool) -> Void) {
        guard isTokenExpired() else {
            completion(true)
            return
        }
        getRefreshToken { (token, error) in
            completion(true) // ????
        }
        completion(false)
    }
}
