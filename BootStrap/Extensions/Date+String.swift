//
//  Date+String.swift
//   
//
//  Created by Istiak on 9/8/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

extension Date {
    func stringValue(_ dateFormatter: DateFormatter) -> String {
        return dateFormatter.string(from: self)
    }
}
