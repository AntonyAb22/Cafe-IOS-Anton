//
//  Log.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 27.12.2025.
//

import Foundation

public protocol Loggable {
    var debugString: String { get }
}

public enum LogType: String {
    case error
    case log
    case warning
}

public func dataDebugDescription(_ data: Data) -> String {
    #if DEBUG
    let result = "\(String(data: data, encoding: .utf8) ?? debugLogString(type: .error, sender: String.self, message: "Failed data to UTF-8 string encoding"))"
    return result
    #else
    return ""
    #endif
}

private func debugLog(type: LogType = .log, sender: Any, message: String, error: Error? = nil) {
    #if DEBUG
    print(debugLogString(sender: sender, message: message, error: error))
    #endif
}

public func debugLogString(type: LogType = .log, sender: Any, message: String, error: Error? = nil) -> String {
    #if DEBUG
    var logString = (type == .log) ? "" : "\(type.rawValue) from "
    logString += "\(String(describing: sender.self)): \((message.count == 0) ? "<empty>" : message)"
    if let error = error { logString += " [\(error)]" }
    logString += "."
    return logString
    #else
    return ""
    #endif
}

public func errorLog(sender: Any, message: String, error: Error? = nil) {
    debugLog(type: .error, sender: sender, message: message, error: error)
}

public func fatalError(sender: Any, message: String, error: Error? = nil) {
    fatalError(debugLogString(sender: sender, message: message, error: error))
}

public func log(sender: Any, message: String, error: Error? = nil) {
    debugLog(type: .log, sender: sender, message: message, error: error)
}

public func requestDebugDescription(request: URLRequest,
                                    requestBody: Data? = nil,
                                    error: Error? = nil,
                                    response: URLResponse? = nil,
                                    responseData: Data? = nil) -> String {
    #if DEBUG
    //Request
    var result = "\(request.httpMethod?.uppercased() ?? "<unknown>")-request to '\(request.url?.absoluteString ?? "<empty URL>")'\n"

    let logBody: (Data?) -> Void = { body in
        result += "Body <"
        if let body = body, body.count > 0 {
            result += "\n"
            result += "\(dataDebugDescription(body))\n"
        }
        result += ">\n"
    }
    logBody(requestBody)

    if let error = error {
        result += "\nError: \(error.localizedDescription)\n"
    }

    //Response
    if let response = response {
        result += "\n"
        if let response = response as? HTTPURLResponse {
            result += "HTTP-response with status code '\(response.statusCode)'\n"
        } else {
            result += "Response\n"
        }
        logBody(responseData)
    }

    return result
    #else
    return ""
    #endif
}

public func warningLog(sender: Any, message: String, error: Error? = nil) {
    debugLog(type: .warning, sender: sender, message: message, error: error)
}
