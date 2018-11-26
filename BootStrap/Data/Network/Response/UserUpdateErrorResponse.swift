//
//  UserUpdateErrorResponse.swift
//   
//
//  Created by Istiak on 7/25/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

struct UserUpdateErrorResponse: Codable {
    let message: String
    var errorCode: Int?
    
    enum CodingKeys: String, CodingKey {
        case message
    }
}
