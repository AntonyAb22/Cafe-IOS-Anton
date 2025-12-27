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
    var usDefaultHeaders: Bool { get }
    var body: EndpointBody? { get }
    var multipartsRequestPartType: [MultipartRequestPartType]? { get }
    var timeout: TimeInterval { get }
}

