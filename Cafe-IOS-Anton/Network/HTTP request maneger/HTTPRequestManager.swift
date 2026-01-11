//
//  HTTPRequestManager.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 11.01.2026.
//

import Foundation
import os.log

public class HTTPRequestManager {
    public var defaultHeaders: [String: String]
    
    public init(defaultHeaders: [String : String]) {
        self.defaultHeaders = defaultHeaders
    }
}

public extension HTTPRequestManager {
    
    @discardableResult
    func executeRequest<ResultType: DataInstantiable>(_ httpMethod: HTTPMethod = .get,
                                                      to urlConvertible: URLConvertible,
                                                      headers: [String: String] = [:],
                                                      useDefaultHeaders: Bool = true,
                                                      withBody body: DataConvertible? = nil,
                                                      timeout: TimeInterval = RequestTimeout.standart.rawValue,
                                                      token: String? = nil,
                                                      completion: @escaping HTTPResponseHandler<ResultType>) -> URLSessionTask? {
        var requestUrl: URL
        do {
            requestUrl = try urlConvertible.getURL()
        } catch {
            completion((.failure(.urlGenerationError(error: error)), debugLogString(type: .error, sender: self, message: "Request URL generation error")))
            return nil
        }
        var requestHeaders = useDefaultHeaders ? defaultHeaders :  [:]
        requestHeaders.merge(headers) { (current, _) in current }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = httpMethod.rawValue
        request.timeoutInterval = timeout
        requestHeaders.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        var bodyData: Data?
        if let payload = body {
            do {
                bodyData = try payload.getData()
                let json = try? JSONSerialization.jsonObject(with: bodyData!)
                print("Debug:/ \(String(describing: json))")
            } catch {
                completion((.failure(.requestBodyEncodingError(error: error)), debugLogString(type: .error, sender: self, message: "Body generation error")))
                return nil
            }
        }
        
        let taskResultHandler = { (data: Data?, response: URLResponse?, error: Error?) in
            let debugDescription = requestDebugDescription(request: request, requestBody: bodyData, error: error, response: response, responseData: data)
            print(debugDescription)
            
            if let error = error {
                completion((.failure(.requestExecutionError(error: error)), debugDescription))
                return
            }
            if let response = response as? HTTPURLResponse {
                let code = response.statusCode
                switch code {
                case 200...299:
                    var result: ResultType?
                    if let data = data {
                        do {
                            result = try ResultType(with: data)
                        } catch {
                            completion((.failure(.responseBodyDecodingError(error: error)), debugDescription))
                            return
                        }
                    }
                    completion((.success(result), debugDescription))
                case 401:
                    print("401 ошибка")
                    completion((.failure(httpRequestErrorByCode(code)), debugDescription))
                default: completion((.failure(httpRequestErrorByCode(code)), debugDescription))
                }
            } else {
                completion((.failure(.responseIsMissing), debugDescription))
            }
        }
        request.httpBody = bodyData
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: taskResultHandler)
        task.resume()
        print("✅", terminator: " ")
        dump(request)
        print("✅ httpBody", request.httpBody.flatMap { String(data: $0, encoding: .utf8) })
        print(request.cURL())
        return task
    }
    
    func executeMultipartRequest<ResultType: DataInstantiable>(_ httpMethod: HTTPMethod = .get,
                                                               to urlConvertible: URLConvertible,
                                                               headers: [String: String] = [:],
                                                               useDefaultHeaders: Bool = true,
                                                               withParts parts: [MultipartRequestPartType?],
                                                               timeout: TimeInterval = RequestTimeout.standart.rawValue,
                                                               token: String? = nil,
                                                               completion: @escaping
                                                               HTTPResponseHandler<ResultType>)  {
        let boundary = MultipartRequestBoundary.shared
        var headers = headers
        headers.updateValue(boundary.httpHeaderContentType, forKey: HTTPHeaders.contentType.rawValue)
        let body = MultipartRequestBody(withBoundary: boundary, parts: parts)
        
        executeRequest(httpMethod, to: urlConvertible, headers: headers, useDefaultHeaders: useDefaultHeaders, withBody: body, timeout: timeout, completion: completion)
        
    }
}

