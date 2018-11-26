//
//  Router.swift
//   
//
//  Created by Istiak on 4/10/18.
//  Copyright © 2018 mlbd. All rights reserved.
//

import Alamofire
import CryptoSwift

enum APIRouter: URLRequestConvertible {
    
    case login(parameters: Parameters)
    case register(parameters: Parameters)
    case getUserInfo
    case updateUser(parameters: Parameters)
    case deleteUser(parameters: Parameters)
    case photoUpload(parameters: Parameters)
    case getUserList(pageNo: Int, itemPerPage: Int)
    
    // MARK: Method
    var method: HTTPMethod {
        switch self {
        case .getUserInfo,
             .getUserList:
            return .get
        case .login,
             .register:
            return .post
        case .photoUpload:
            return .post
        case .updateUser:
            return .put
        case .deleteUser:
            return .delete
        }
    }
    
    // MARK: Path
    var path: String {
        switch self {
        case .photoUpload:
            return "/users/photos/upload"
        case .updateUser:
            return "/users"
        case .login:
            return "/users/login"
        case .register:
            return "/users/register"
        case .getUserInfo:
            return "/users"
        case .getUserList:
            return "/users"
        case .deleteUser:
            return "/users"
        }
    }
    
    // MARK: Parameters
    private var parameters: Parameters? {
        switch self {
        case .photoUpload,
             .getUserInfo,
             .getUserList:
            return nil
        case .updateUser(let param),
             .deleteUser(let param),
             .login(let param),
             .register(let param):
            return param
        }
    }

    private var queryItems: [URLQueryItem]? {
        switch self {
        case .getUserList(let pageNo, let itemPerPage):
            return [
                URLQueryItem(name: "page", value: "\(pageNo)"),
                URLQueryItem(name: "per", value: "\(itemPerPage)")
            ]
        default:
            return nil
        }
    }
    
    private var timestamp: Int? {
        switch self {
        case .login,
             .register:
            return Int(Date().timeIntervalSince1970)
        default:
            return nil
        }
    }
    
    private var checksum: String? {
        switch self {
        case .login,
             .register:
            let value = String(self.timestamp!) + APIConstant.secret
            return value.sha1()
        default:
            return nil
        }
    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
      //  let url = try ApiPath.baseURLString.asURL()
        var urlParameters = URLComponents(string: ApiPath.baseURLString)
        urlParameters?.path = ApiPath.version + path
        urlParameters?.queryItems = queryItems

        guard let _url = urlParameters?.url else { fatalError("Not a valid URL") }
        var urlRequest = URLRequest(url: _url)

        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        //urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        if timestamp != nil && checksum != nil {
            urlRequest.setValue(String(timestamp!), forHTTPHeaderField: HTTPHeaderField.timestamp.rawValue)
            urlRequest.setValue(checksum!, forHTTPHeaderField: HTTPHeaderField.checksum.rawValue)
        }
        
        // Parameters
        if let parameters = parameters {
            switch self {
            case .deleteUser:
                 let params = parameters["data"] as! [[String: Any]]
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: params, options:.prettyPrinted)
                    urlRequest.httpBody = jsonData
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            default:
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: parameters, options:.prettyPrinted)
                    urlRequest.httpBody = jsonData
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            }
        }

        return urlRequest
    }
}
