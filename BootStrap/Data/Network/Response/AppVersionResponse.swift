//
//  AppVersionResponse.swift
//   
//
//  Created by Istiak on 9/24/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
struct AppVersionResponse: Codable {
    let platform: Int
    let minor: Int
    let version: String
    let major: Int
    let patch: Int
    let forceVersionUp: Bool
    
    enum CodingKeys: String, CodingKey {
        case platform = "platform"
        case minor = "minor"
        case version = "version"
        case major = "major"
        case patch = "patch"
        case forceVersionUp = "forceVersionUp"
    }
}
