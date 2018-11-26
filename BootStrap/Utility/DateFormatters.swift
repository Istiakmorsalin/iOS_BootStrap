//
//  DateFormatters.swift
//   
//
//  Created by Istiak on 9/8/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

struct DateFormatters {
    static var yyyyMMddTHHmmssZ: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat =  "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return formatter
    }

    static var yyyyMMddHHmmsszzzzZZZ: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz ZZZ"
        return formatter
    }

    static var yyyyMMddDash: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }

    static var yyyyMMddDot: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter
    }

    static var yyyy年MM月dd日: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        return formatter
    }

    static var yyyyMMddSlash: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }
}
