//
//  HTTP.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 27.12.2025.
//
import Foundation

public protocol DataInstantiable {
    init(with data: Data) throws
}

public typealias HTTPRequestResult<ResultType: DataInstantiable> = (Result<ResultType?, HTTPRequestError>, String)
public typealias HTTPResponseHandler<ResultType: DataInstantiable> = (HTTPRequestResult<ResultType>) -> Void
public typealias ResultHandler<ResultType> = (Result<ResultType, Error>) -> Void

public enum HTTPHeaders : String {
    case contentType = "Content-Type"
}

public enum HTTPHeaderContentType : String {
    case json = "application/json"
    case urlEncodedUTF8 = "application/x-www-form-urlencoded;charset=utf-8"
}

public enum HTTPMethod : String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}

public enum HTTPRequestError : Error {
    case clientError(code: Int)
    case forbiddenError
    case internalServerError
    case notFoundError
    case requestBodyEncodingError(Error: Error)
    case requestExecutionError(Error: Error)
    case responseBodyDecodingError(Error: Error)
    case responseIsMissing
    case serverError(code: Int)
    case unauthorizedError
    case unknownError
    case unknownResponseStatusError(code: Int)
    case urlGenerationError(Error: Error)
}

public func httpRequestErrorByCode(_ code: Int) -> HTTPRequestError {
    switch code {
    case 401: return .unauthorizedError
    case 403: return .forbiddenError
    case 404: return .notFoundError
    case 400...499: return .clientError(code: code)
    case 500: return .internalServerError
    case 500...599: return .serverError(code: code)
    default: return .unknownResponseStatusError(code: code)
    }
}

public enum RequestTimeout: TimeInterval {
    case standart = 60.0
    
    
}

