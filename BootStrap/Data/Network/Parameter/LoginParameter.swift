//
//  LoginParameter.swift
//
//  Created by Istiak on 7/20/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

public class LoginParameter: Parameterizable {
    public let email: String
    public let password: String

    enum CodingKeys: String {
        case email, password
    }

    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }

    func param() -> [String : Any] {
        let dictionaryParams : [String : Any?] = [
            CodingKeys.email.rawValue : self.email,
            CodingKeys.password.rawValue : self.password
            ]

        let fixedParam = dictionaryParams.filter {(_, v) in v != nil }.mapValues { v in return v!}

        return fixedParam
    }
}
