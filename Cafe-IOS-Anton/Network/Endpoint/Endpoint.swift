//
//  Endpoint.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 27.12.2025.
//

import Foundation

public protocol URLConvertible {
    func getURL() throws -> URL
    
}

public protocol  Endpoint: URLConvertible {
    var baseURL: URL { get }
    var path: String { get }
    var subPath: String { get }
    var requestEndpoint: String { get }
    var queryItems: [String: Any]? { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String]? { get }
    var useDefaultHeaders: Bool { get }
    var body: EndpointBody? { get }
    var multipartsRequestPartType: [MultipartRequestPartType]? { get }
    var timeout: TimeInterval { get }
}

public extension Endpoint {
    var timeout: TimeInterval { RequestTimeout.standart.rawValue }
    var useDefaultHeaders: Bool { false }
    var headers: [String: String]? {
        var header = ["Content-Type": "application/json"]
        if let token = UserDefaults.standard.string(forKey: "token") {
            header["Authorization"] = "Bearer " + token
            print("Debug: Authorization header set with token: \(token)")
        }
        return header
    }
    
    var queryItems: [String: Any]? {
         nil
    }
    
    var body: EndpointBody? {
        nil
    }
    
    var multipartsRequestPartType: [MultipartRequestPartType]? {
        nil
    }
    
    var baseUrl: URL {
        guard let url = URL(string: "Cafe-anton.filtsy.ru/") else {
            fatalError()
        }
        return url
    }
    
    var path: String {
        subPath + requestEndpoint
    }
    
    var subPath: String {
        "v1"
    }
}

public extension Endpoint {
    func getURL() throws -> URL {
        let url = baseURL.appendingPathComponent(path)
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !(queryItems?.isEmpty ?? true) {
            var urlQueryItems = [URLQueryItem]()
            if let queryItems = queryItems {
                for (key, value) in queryItems {
                    if let value = value as? [Any] {
                        value.forEach { value in
                            urlQueryItems.append(URLQueryItem(name: key + "[]", value: String(describing: value)))
                        }
                    } else {
                        urlQueryItems.append(URLQueryItem(name: key, value: String(describing: value)))
                    }
                }
            }
            urlComponents.queryItems = urlQueryItems
                    return urlComponents.url!
        }
        return url
    }
}
