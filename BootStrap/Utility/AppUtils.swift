//
//  AppUtils.swift
//   
//
//  Created by Istiak on 12/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

func Localised(_ key: String, values:[String: String]? = nil) -> String {
    var string = NSLocalizedString(key, comment: key)
    if let values = values {
        for (key, value) in values {
            string = string.replacingOccurrences(of: key, with: value)
        }
    }
    return string
}
