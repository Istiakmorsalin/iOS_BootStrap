//
//  UserResponse.swift
//   -dev
//
//  Created by Istiak on 2018/09/28.
//  Copyright © 2018年 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

struct UserResponse: Codable {
    let nickname: String?
    let iconUrl: String?
    let birthYear: Int?
    let sex: Int?
    let loginId: String
    let id: Int
    let permissionLevel: Int

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)

        nickname = try container.decodeIfPresent(String.self, forKey: .nickname)
        iconUrl = try container.decodeIfPresent(String.self, forKey: .iconUrl)
        birthYear = try container.decodeIfPresent(Int.self, forKey: .birthYear)
        sex = try container.decodeIfPresent(Int.self, forKey: .sex)
        loginId = try container.decode(String.self, forKey: .loginId)
        id = try container.decode(Int.self, forKey: .id)
        permissionLevel = try container.decode(Int.self, forKey: .permissionLevel)
    }

    enum RootKeys: String, CodingKey {
        case nickname, iconUrl, birthYear, sex, loginId, id, permissionLevel, updatedAt
    }
}
