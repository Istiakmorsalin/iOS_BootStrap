//
//  LoginResponse.swift
//   
//
//  Created by Istiak on 8/13/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    let accessToken, refreshToken: String
    let user: User
}

struct User: Codable {
    let id: Int
    let loginID: String
    let permissionLevel: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case loginID = "loginId"
        case permissionLevel
    }

    static func saveUser(_ user: User) {
        PersistenceManager.shared.saveUser(user)
    }

    static func isUserAuther(_ id: Int) -> Bool {
        guard let user = PersistenceManager.shared.getUser() else { return false }
        return user.id == id
    }
}
