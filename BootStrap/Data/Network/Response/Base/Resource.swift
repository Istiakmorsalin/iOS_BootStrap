//
//  Resource.swift
//   
//
//  Created by Istiak on 4/12/18.
//  Copyright © 2018 mlbd. All rights reserved.
//

import Foundation

enum Status {
    case success
    case error(Int, String)
    case loading
}

class Resource<T, E> {
    public let status: Status
    public let data: T?
    public let error: E?
    
    init (status: Status, data: T?, error: E?) {
        self.status = status
        self.data = data
        self.error = error
    }
    
    public static func success(data: T?) -> Resource<T, E> {
        return Resource(status: Status.success, data: data, error: nil)
    }
    
    public static func error(code: Int, msg: String, error: E?) -> Resource<T, E> {
        return Resource(status: Status.error(code, msg), data: nil, error: error)
    }
    
    public static func loading() -> Resource<T, E> {
        return Resource(status: Status.loading, data: nil, error: nil)
    }
}
