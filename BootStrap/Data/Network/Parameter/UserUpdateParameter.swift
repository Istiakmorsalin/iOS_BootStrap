//
//  UserParameter.swift
//   
//
//  Created by Istiak on 7/25/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

public class UserUpdateParameter: Parameterizable {
    public let nickName: String?
    public let iconImageUrl: String?
    public let sex: Int?
    public let birthYear: Int?
    
    enum CodingKeys: String {
        case nickName = "nickname"
        case iconImageUrl = "iconUrl"
        case sex = "sex"
        case birthYear = "birthYear"
    }
    
    public init(
        nickName: String? = nil,
        iconImageUrl: String? = nil,
        sex: Int? = nil,
        birthYear: Int? = nil
        ) {
        self.nickName = nickName
        self.iconImageUrl = iconImageUrl
        self.sex = sex
        self.birthYear = birthYear
    }
    
    func param() -> [String : Any] {
        let dictionaryParams : [String : Any?] = [
            CodingKeys.nickName.rawValue : self.nickName,
            CodingKeys.iconImageUrl.rawValue : self.iconImageUrl,
            CodingKeys.sex.rawValue : self.sex,
            CodingKeys.birthYear.rawValue : self.birthYear
        ]
        
        let fixedParam = dictionaryParams.filter {(_, v) in v != nil }.mapValues { v in return v!}
        
        return fixedParam
    }
}
