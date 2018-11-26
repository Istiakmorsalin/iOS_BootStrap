//
//  NetworkManager.swift
//   
//
//  Created by Istiak on 4/10/18.
//  Copyright © 2018 mlbd. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireManager {
    static let authApiSharedManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = APIConstant.DEFAULT_TIMEOUT_INTERVAL
        let sessionManager = SessionManager(configuration: configuration)
        
        return sessionManager
    }()
    
    static let hostApiSharedManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = APIConstant.DEFAULT_TIMEOUT_INTERVAL
        let sessionManager = SessionManager(configuration: configuration)
        let oAuthHandler = OAuthHandler()
        sessionManager.adapter = oAuthHandler
        sessionManager.retrier = oAuthHandler
        
        return sessionManager
    }()
    
    static let awsSharedManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = APIConstant.DEFAULT_TIMEOUT_INTERVAL
        let sessionManager = SessionManager(configuration: configuration)
        
        return sessionManager
    }()
}

class OAuthHandler: RequestAdapter, RequestRetrier {
    
    private typealias RefreshCompletion = (_ succeeded: Bool, _ accessToken: String?) -> Void
    
    private let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        
//        var headers = SessionManager.defaultHTTPHeaders
//        let timestamp = Int(Date().timeIntervalSince1970)
//        let checksumString = String(timestamp) + APIConstant.secret
//        headers[HTTPHeaderField.timestamp.rawValue] = String(timestamp)
//        headers[HTTPHeaderField.checksum.rawValue] = checksumString.sha1()
//
//        configuration.httpAdditionalHeaders = headers
        
        return SessionManager(configuration: configuration)
    }()
    
    private let lock = NSLock()
    
    private var isRefreshing = false
    private var requestsToRetry: [RequestRetryCompletion] = []
    private var preferencesService = PreferencesService()
    
    // MARK: - Initialization
    
    public init() {
        
    }
    
    // MARK: - RequestAdapter
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
      //  urlRequest.setValue("Bearer " + preferencesService.getAccessToken(), forHTTPHeaderField: "Authorization")
        
        urlRequest.setValue("Bearer " + "accessToken", forHTTPHeaderField: "Authorization")
        
        return urlRequest
    }
    
    // MARK: - RequestRetrier
    
    func should(_ manager:      Alamofire.SessionManager,
                retry request:  Alamofire.Request,
                with error:     Swift.Error,
                completion:     @escaping Alamofire.RequestRetryCompletion) {
        lock.lock() ; defer { lock.unlock() }
        
        if let response = request.task?.response as? HTTPURLResponse, response.statusCode == HTTPStatusCodes.Unauthorized.rawValue {
            requestsToRetry.append(completion)
            
            if !isRefreshing {
                refreshTokens { [weak self] succeeded, accessToken in
                    guard let strongSelf = self else { return }
                    
                    strongSelf.lock.lock() ; defer { strongSelf.lock.unlock() }
                    
                    if let accessToken = accessToken {
                        strongSelf.preferencesService.setAccessToken(accessToken: accessToken)
                    }
                    
                    strongSelf.requestsToRetry.forEach { $0(succeeded, 0.0) }
                    strongSelf.requestsToRetry.removeAll()
                }
            }
        } else {
            completion(false, 0.0)
        }
    }
    
    // MARK: - Private - Refresh Tokens
    
    private func refreshTokens(completion: @escaping RefreshCompletion) {
        guard !isRefreshing else { return }
        
        isRefreshing = true
        
        let urlString = ApiPath.baseURLString + ApiPath.version + "/users/refresh"
        if let refreshToken = preferencesService.getrefreshToken() {
            let parameters: [String: Any] = [
                "refreshToken": refreshToken
            ]
            
            var headers = SessionManager.defaultHTTPHeaders
            let timestamp = Int(Date().timeIntervalSince1970)
            let checksumString = String(timestamp) + APIConstant.secret
            headers[HTTPHeaderField.timestamp.rawValue] = String(timestamp)
            headers[HTTPHeaderField.checksum.rawValue] = checksumString.sha1()
            
            sessionManager.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                .response { [weak self] response in
                    guard let strongSelf = self else { return }
                    
                    do {
                        let response = try JSONDecoder().decode(RefreshTokenResponse.self, from: response.data!)
                        completion(true, response.accessToken)
                        
                    } catch let error {
                        log.debug(error)
                        completion(false, nil)
                    }
                    
                    strongSelf.isRefreshing = false
            }
        }
    }
}
