//
//  AppsFlyerAnalyticsManager.swift
//   
//
//  Created by Istiak on 9/19/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import AppsFlyerLib

class AppsFlyerAnalyticsManager {
    
    static let shared = AppsFlyerAnalyticsManager()
    
    private init() {
        AppsFlyerTracker.shared().isDebug = false
    }
    
    public func logEvent(eventName: String) {
        AppsFlyerTracker.shared().trackEvent(eventName, withValues: nil)
    }
    
    public func logEvent(eventName: String, _ parameterKey: String, _ parameterValue: String) {
        AppsFlyerTracker.shared().trackEvent(eventName, withValues: [parameterKey: parameterValue])
    }
    
    public func logEvent(eventName: String, _ parameterKey: String, _ parameterValue: Int) {
        AppsFlyerTracker.shared().trackEvent(eventName, withValues: [parameterKey: parameterValue])
    }
}
