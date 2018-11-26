//
//  Int+Extra.swift
//   
//
//  Created by Istiak on 10/8/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

extension Int {
    var shortValue: String {
        let k: Double = 1000
        let m: Double = 1000000
        let value = Double(self)

        if value >= k && value < m {
            let double = (value/k).rounded(toPlaces: 1)
            return  String(format:"%g", double) + "k"
        } else if value >= m {
            let double = (value/m).rounded(toPlaces: 1)
            return String(format:"%g", double) + "m"
        }
        return "\(self)"
    }
}
