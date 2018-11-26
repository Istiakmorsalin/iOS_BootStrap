//
//  APIClient.swift
//   
//
//  Created by Istiak on 4/10/18.
//  Copyright © 2018 mlbd. All rights reserved.
//

import Alamofire
import RxSwift

// swiftlint:disable all
class AuthAPIClient {
    
    private static var requestSubject: PublishSubject<Response>!
    private static var route: APIRouter!
    
    private static func performRequest(route: APIRouter) -> Observable<Response> {
        self.route = route
        let requestSubject = PublishSubject<Response>()
        self.requestSubject = requestSubject
        performNetworkCall(route: route, requestSubject: requestSubject)
        return requestSubject.asObservable()
    }
    
    private static func performNetworkCall(route: APIRouter, requestSubject: PublishSubject<Response>) {
        let request = AlamofireManager.authApiSharedManager.request(route)
        log.debug("Request URl: \(String(describing: request))")

        request
            .validate()
            .responseData { response in
                log.debug("Response URl: \(String(describing: response.request) + "\n")")
                log.debug("Response HTTPHeaderFields: \(String(describing: response.request?.allHTTPHeaderFields) + "\n")")
                log.debug("Response HTTPURLResponse: \(String(describing: response.response) + "\n")")
                do {
                    if let data = response.data {
                        if let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any] {
                            log.debug("Response data: \(jsonData)")
                        }
                    }
                } catch {
                    log.debug("JSONSerialization failed")
                }
                
                switch response.result {
                case .success:
                    if let value = response.result.value {
                        requestSubject.on(Event.next(Response.success(data: value)))
                    }
                    
                case .failure(let errorResponse):
                    if let error = errorResponse as? AFError {
                        log.debug("Error code:\(error._code)")
                        
                        switch error {
                        case .invalidURL(let url):
                            log.debug("Invalid URL: \(url) - \(error.localizedDescription)")
                        case .parameterEncodingFailed(let reason):
                            log.debug("Parameter encoding failed: \(error.localizedDescription)")
                            log.debug("Failure Reason: \(reason)")
                        case .multipartEncodingFailed(let reason):
                            log.debug("Multipart encoding failed: \(error.localizedDescription)")
                            log.debug("Failure Reason: \(reason)")
                        case .responseValidationFailed(let reason):
                            log.debug("Response validation failed: \(error.localizedDescription)")
                            log.debug("Failure Reason: \(reason)")
                            
                            switch reason {
                            case .dataFileNil, .dataFileReadFailed:
                                log.debug("Downloaded file could not be read")
                            case .missingContentType(let acceptableContentTypes):
                                log.debug("Content Type Missing: \(acceptableContentTypes)")
                            case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                                log.debug("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                            case .unacceptableStatusCode(let code):
                                log.debug("Response status code was unacceptable: \(code)")
                                log.debug("Error code:\(code)")
                                
                                if let errorResponseData = response.data {
                                    requestSubject.on(Event.next(Response.error(errorResponse: ErrorResponse.error(code, error.localizedDescription), data: errorResponseData)))
                                } else {
                                    requestSubject.on(Event.next(Response.error(errorResponse: ErrorResponse.error(code, error.localizedDescription), data: nil)))
                                }
                            }
                        case .responseSerializationFailed(let reason):
                            log.debug("Response serialization failed: \(error.localizedDescription)")
                            log.debug("Failure Reason: \(reason)")
                        }
                        log.debug("Underlying error: \(String(describing: error.underlyingError))")
                    } else if let error = errorResponse as? URLError {
                        log.debug("URLError occurred: \(error)")
                        requestSubject.on(Event.next(Response.error(errorResponse: ErrorResponse.error(error.code.rawValue, error.localizedDescription), data: nil)))
                    } else {
                        log.debug("Unknown error: \(String(describing: errorResponse))")
                    }
                }
        }
    }
    
    static func register(parameters: Parameters) -> Observable<Response> {
        return performRequest(route: APIRouter.register(parameters: parameters))
    }
    
    static func login(parameters: Parameters) -> Observable<Response> {
        return performRequest(route: APIRouter.login(parameters: parameters))
    }
}
