//
//  ClientAPIResponse.swift
//   
//
//  Created by Istiak on 5/16/18.
//  Copyright © 2018 mlbd. All rights reserved.
//

import Foundation

enum ResponseStatus {
    case success
    case error(ErrorResponse)
}

class Response {
    public let status: ResponseStatus
    public let data: Data?
    
    init (status: ResponseStatus, data: Data?) {
        self.status = status
        self.data = data
    }
    
    public static func success(data: Data?) -> Response {
        return Response(status: ResponseStatus.success, data: data)
    }
    
    public static func error(errorResponse: ErrorResponse, data: Data? = nil) -> Response {
        return Response(status: ResponseStatus.error(errorResponse), data: data)
    }
}
