//
//  APIConstants.swift
//   
//
//  Created by Istiak on 4/10/18.
//  Copyright © 2018 mlbd. All rights reserved.
//

import Foundation

class APIConstant {
    static let DEFAULT_TIMEOUT_INTERVAL: TimeInterval = 60.0
    static let secret = "XIh/zpCR/yHINVXWrhLJBBKeLV6vlr4R+gYeUONQXYO13Q5mGWvZ7FJgpJouyN8"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case timestamp = "X- -Timestamp"
    case checksum = "X- -Checksum"
}

enum ContentType: String {
    case json = "application/json"
    case urlencoded = "application/x-www-form-urlencoded"
    case password = "X- -Password"
}
