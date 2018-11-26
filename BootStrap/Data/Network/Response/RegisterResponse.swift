//
//  RegisterResponse.swift
//   
//
//  Created by Istiak on 8/13/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

struct RegisterResponse: Codable {
    let id: Int
    let loginID: String
    let permissionLevel: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case loginID = "loginId"
        case permissionLevel
    }
}
