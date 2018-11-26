//
//  FirebaseAnalyticsManager.swift
//   
//
//  Created by Istiak on 9/18/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import Firebase

class FirebaseAnalyticsManager {
    
    static let shared = FirebaseAnalyticsManager()
    
    public func logEvent(eventName: String) {
        Analytics.logEvent(eventName, parameters: nil)
    }
    
    public func logEvent(eventName: String, _ parameterKey: String, _ parameterValue: String) {
        Analytics.logEvent(eventName, parameters: [
            parameterKey: parameterValue as NSObject
        ])
    }
    
    public func logEvent(eventName: String, _ parameterKey: String, _ parameterValue: Int) {
        Analytics.logEvent(eventName, parameters: [
            parameterKey: parameterValue as NSObject
        ])
    }
    
    public func logEvent(eventName: String, parameters: [String: NSObject]) {
        Analytics.logEvent(eventName, parameters: parameters)
    }
}
