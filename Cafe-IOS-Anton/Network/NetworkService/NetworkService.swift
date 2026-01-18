//
//  NetworkService.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 17.01.2026.
//

import Foundation

open class NetworkService<APIEndPoint: Endpoint> {
    
    private var defaultHeaders: [String: String]
    private var requestManager: HTTPRequestManager
    
    public init(defaultHeaders: [String : String] = [:]) {
        self.defaultHeaders = defaultHeaders
        self.requestManager = HTTPRequestManager(defaultHeaders: defaultHeaders)
    }
}

public extension NetworkService {
    
    @discardableResult
    func executeRequest<ResultType: DataInstantiable>(
        to endPoint: APIEndPoint,
        completion: @escaping (_ resultData: ResultType?, _ error: Error?) -> Void
    ) -> URLSessionTask? {
        return requestManager.executeRequest(
            endPoint.httpMethod,
            to: endPoint,
            headers: endPoint.headers ?? [:],
            useDefaultHeaders: endPoint.useDefaultHeaders,
            withBody: endPoint.body,
            timeout: endPoint.timeout
        ) { (result: HTTPRequestResult<ResultType>) in
            DispatchQueue.main.async {
                switch result.0 {
                case .success(let resultData): completion(resultData, nil)
                case .failure(let error): print("Ощибка запроса: \(error)")
                    self.handleError(error, for: endPoint, completion: completion)
                }
            }
        }
    }
    
    private func handleError<ResultType: DataInstantiable>(
        _ error: HTTPRequestError,
        for endPoint: APIEndPoint,
        completion: @escaping (_ resultData: ResultType?, _ error: Error?) -> Void
    ) {
        switch error {
        case .unauthorizedError: print("Обработка ошибки 401")
            self.handleTokenExpiration { success in
                if success {
                    print("Токен обновлен, повторный запрос...")
                    _ = self.executeRequest(to: endPoint, completion: completion)
                } else {
                    print("Не удалось обновить токен")
                    completion(nil, error)
                }
            }
        default: completion(nil, error)
        }
    }
    
    private func getRefreshToken(completion: @escaping (AuthToken?, Error?) -> Void) {
        //        let endPoint = AuthEndPoint.getRefreshToken
        let service = AuthService().getRefreshToken { token, error in
            completion(token, error)
        }
    }
    
    private func handleTokenExpiration(completion: @escaping (Bool) -> Void) {
        getRefreshToken { newToken, error in
            if let newToken = newToken {
                UserDefaults.standard.set(newToken.token, forKey: "token")
                print("token обновлен: \(newToken.token)")
                completion(true)
            } else {
                print("Ощибка при обновлении токена: \(error?.localizedDescription ?? "Неизвестная ошибка")")
                completion(false)
            }
        }
        
    }
    
    func executeMultipartRequest<ResultType: DataInstantiable>(
        to endPoint: APIEndPoint,
        completion: @escaping (_ resultData: ResultType?, _ error: Error?) -> Void
    ) {
        requestManager.executeMultipartRequest(
            endPoint.httpMethod,
            to: endPoint,
            headers: endPoint.headers ?? [String:String](),
            withParts: endPoint.multipartsRequestPartType ?? [],
        ) { (result: HTTPRequestResult<ResultType>) in
             DispatchQueue.main.async {
                 switch result.0 {
                 case .success(let resultData): completion(resultData, nil)
                 case .failure(let error): print("Ощибка запроса: \(error)")
                     self.handleError(error, for: endPoint, completion: completion)
                 }
             }
        }
    }
}

