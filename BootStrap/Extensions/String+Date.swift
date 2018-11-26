//
//  String+Date.swift
//   
//
//  Created by Istiak on 9/8/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

extension String {
    func dateValue(_ dateFormatter: DateFormatter) -> Date? {
        return dateFormatter.date(from: self)
    }
}

extension String {
    var trimmed: String? {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
