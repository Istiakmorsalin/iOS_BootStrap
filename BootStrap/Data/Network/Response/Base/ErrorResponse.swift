//
//  Error.swift
//   
//
//  Created by Istiak on 17/4/18.
//  Copyright © 2018 mlbd. All rights reserved.
//

import Foundation

public enum ErrorResponse: Swift.Error, CustomStringConvertible {
    
    case error(Int, String)
    
    public var description: String {
        switch self {
        case .error(_, let message):
            return message
        }
    }
    
    public var code: Int {
        switch self {
        case .error(let code, _):
            return code
        }
    }
}
