//
//  UserModel.swift
//   
//
//  Created by Istiak on 27/8/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

struct UserModel {
    let name: String?
    let iconURL: URL?
    let birthYear, sex: Int?
    let loginID: String
    let id, permissionLevel: Int

    init(id: Int, name: String?, iconURL: String?, birthYear: Int?, sex: Int?, loginID: String, permissionLevel: Int) {
        self.id = id
        self.name = name
        self.iconURL = iconURL?.toURL
        self.birthYear = birthYear
        self.sex = sex
        self.loginID = loginID
        self.permissionLevel = permissionLevel
    }
}
