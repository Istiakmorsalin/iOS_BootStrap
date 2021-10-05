//
//  Logger.swift
//  democrashlytics
//
//  Created by Istiak on 7/5/18.
//  Copyright © 2018 Sekailab. All rights reserved.
//

import Foundation

class Logger: LoggerType {

    private init() {}
    
    //Use for recording errors to firebase console
    static func logError(_ error: Error) {
        log.debug(error)
    }
    //Use for writing log with firebase
    static func debugLog(_ message: String, file: StaticString = #file, function: StaticString = #function, line: Int = #line) {
        let output: String
        if let filename = URL(fileURLWithPath: file.description).lastPathComponent.components(separatedBy: ".").first {
            output = "\(filename).\(function) line \(line) $ \(message)"
        } else {
            output = "\(file).\(function) line \(line) $ \(message)"
        }
        #if targetEnvironment(simulator)
        NSLogv("%@", getVaList([output]))
        #elseif DEBUG
        CLSNSLogv("%@", getVaList([output]))
        #else
        CLSLogv("%@", getVaList([output]))
        #endif
    }
}
