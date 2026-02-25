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
    
    public init(defaultHeaders: [String: String] = [:]) {
        self.defaultHeaders = defaultHeaders
        self.requestManager = HTTPRequestManager(defaultHeaders: defaultHeaders)
    }
}

// MARK: - Requests
public extension NetworkService {
    
    @discardableResult
    func executeRequest<ResultType: DataInstantiable>(
        to endPoint: APIEndPoint,
        completion: @escaping (_ resultData: ResultType?, _ error: Error?) -> Void
    ) -> URLSessionTask? {
        
        // Для refresh запроса используем refresh token, для остальных - access token.
        var headers = endPoint.headers ?? [:]
        let token = endPoint.isRefreshEndpoint
            ? KeyChain.shared.getRefreshToken()
            : KeyChain.shared.getAccessToken()
        
        if let token = token {
            headers["Authorization"] = "Bearer \(token)"
        }
        
        return requestManager.executeRequest(
            endPoint.httpMethod,
            to: endPoint,
            headers: headers,
            useDefaultHeaders: endPoint.useDefaultHeaders,
            withBody: endPoint.body,
            timeout: endPoint.timeout,
            token: token,
            completion: { (result: HTTPRequestResult<ResultType>) in
                DispatchQueue.main.async {
                    switch result.0 {
                    case .success(let resultData):
                        completion(resultData, nil)
                    case .failure(let error):
                        print("Ошибка запроса: \(error)")
                        self.handleError(error, for: endPoint, completion: completion)
                    }
                }
            }
        )
    }
    
    private func handleError<ResultType: DataInstantiable>(
        _ error: HTTPRequestError,
        for endPoint: APIEndPoint,
        completion: @escaping (_ resultData: ResultType?, _ error: Error?) -> Void
    ) {
        switch error {
        case .unauthorizedError:
            
            if endPoint.isVerificationEndpoint {
                print("401 на verify endpoint → это просто неверный код")
                let verificationError = NSError(
                    domain: "Verification",
                    code: 401,
                    userInfo: [
                        NSLocalizedDescriptionKey: "Неверный код",
                        NSLocalizedFailureReasonErrorKey: "Введенный код неверен. Попробуйте еще раз."
                    ]
                )
                completion(nil, verificationError)
                return
            }
            
            if endPoint.isRefreshEndpoint {
                print("401 на refresh endpoint → повторный refresh не выполняем")
                completion(nil, error)
                return
            }
            
            print("Обработка ошибки 401")
            
            // Создаем экземпляр AuthService для обновления токена
            let authService = AuthService()
            
            authService.handleTokenExpiration { [weak self] success in
                if success {
                    print("Токен обновлен, повторный запрос...")
                    // Повторный запрос с обновленным токеном
                    _ = self?.executeRequest(to: endPoint, completion: completion)
                } else {
                    print("Не удалось обновить токен")
                    completion(nil, error)
                }
            }
            
        default:
            completion(nil, error)
        }
    }
    
    func executeMultipartRequest<ResultType: DataInstantiable>(
        to endPoint: APIEndPoint,
        completion: @escaping (_ resultData: ResultType?, _ error: Error?) -> Void
    ) {
        requestManager.executeMultipartRequest(
            endPoint.httpMethod,
            to: endPoint,
            headers: endPoint.headers ?? [String: String](),
            withParts: endPoint.multipartsRequestPartType ?? []
        ) { (result: HTTPRequestResult<ResultType>) in
            DispatchQueue.main.async {
                switch result.0 {
                case .success(let resultData):
                    completion(resultData, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
    }
}


extension Data: DataInstantiable {
    
    public init(with data: Data) throws {
        self = data
    }
}
