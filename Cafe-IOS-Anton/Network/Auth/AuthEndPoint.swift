//
//  AuthEndPoint.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 18.01.2026.
//

import Foundation

enum AuthEndPoint {
    case login(login: String, password: String)
    case getCurrentUser
    case getRefreshToken
}

extension AuthEndPoint: Endpoint {
    
    var requestEndpoint: String {
        switch self {
        case .login:           return "/auth/login"
        case .getCurrentUser:  return "/auth"
        case .getRefreshToken: return "/auth/refresh"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login:           return .post
        case .getCurrentUser:  return .get
        case .getRefreshToken: return .get
        }
    }
    
    var body: EndpointBody? {
        switch self {
        case .getCurrentUser: return nil
        case .login(let login, let password):
            let requstBody: [String: Any] = [
                "login": login,
                "password": password
            ]
            return EndpointBody(requestBody: requstBody)
        case .getRefreshToken: return nil
        }
    }
}
