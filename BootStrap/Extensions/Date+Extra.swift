//
//  Date+Extra.swift
//   
//
//  Created by Istiak on 9/8/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

extension Date {

    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }

    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }

    var second: Int {
        return Calendar.current.component(.second, from: self)
    }

    var year: Int {
        return Calendar.current.component(.year, from: self)
    }

    var month: Int {
        return Calendar.current.component(.month, from: self)
    }

    var day: Int {
        return Calendar.current.component(.day, from: self)
    }

    var timeZone: Int {
        return Calendar.current.component(.timeZone, from: self)
    }

    var shortDateString: String {
        return DateFormatter.localizedString(from: self, dateStyle: .short, timeStyle: .none)
    }

    var shorTimeString: String {
        return DateFormatter.localizedString(from: self, dateStyle: .none, timeStyle: .short)
    }

    var nextMonth: Date? {
        return Calendar.current.date(byAdding: .month, value: 1, to: self)
    }

    var previousMonth: Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }

    var yearMonthString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM"
        return formatter.string(from: self)
    }

    var beginingOfTheMonth: Date? {
        var components = DateComponents()
        components.year = self.year
        components.month = self.month
        components.day = 1
        return Calendar.current.date(from: components)
    }

}

extension Date {
    var ticks: UInt64 {
        return UInt64((self.timeIntervalSince1970 + 62_135_596_800) * 10_000_000)
    }
}
