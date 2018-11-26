//
//  LoggerType.swift
//  democrashlytics
//
//  Created by Istiak on 7/5/18.
//  Copyright © 2018 Sekailab. All rights reserved.
//

import Foundation
import XCGLogger

protocol LoggerType {
    static func logError(_ error: Error)
}
