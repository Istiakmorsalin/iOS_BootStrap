//
//  UserIdParameter.swift
//   
//
//  Created by Istiak on 8/13/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

class UserIdParameter: Parameterizable {
    let loginId: String
    
    init(loginId: String) {
        self.loginId = loginId
    }
    
    func param() -> [String : Any] {
        let dictionaryParams : [String : Any?] = [
            "loginId" : self.loginId
        ]
        
        let fixedParam = dictionaryParams.filter {(_, v) in v != nil }.mapValues { v in return v!}
        
        return fixedParam
    }
}
