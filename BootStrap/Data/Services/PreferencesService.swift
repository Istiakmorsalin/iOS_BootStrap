//
//  PreferencesService.swift
//   
//
//  Created by Istiak on 9/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

protocol HasPreferencesService {
    var preferencesService: PreferencesService { get }
}

/// Represents the keys that are used to store user defaults
struct UserPreferences {
    private init () {}

    static let splash = "splash"
    /// key for registered preference
    static let registered = "registered"
    
    static let accessToken = "accessToken"
    static let refreshToken = "refreshToken"
    
    static let fcmToken = "fcmToken"
    static let fcmRefreshToken = "fcmRefreshToken"
}

/// This service manage the user preferences
class PreferencesService {

    func setSplashing () {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: UserPreferences.splash)
    }
    
    /// sets the registered preference to true
    func setRegistered () {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: UserPreferences.registered)
    }

    func didSplash () -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: UserPreferences.splash)
    }
    
    /// Returns true if the user has already registered, false otherwise
    ///
    /// - Returns: true if the user has already registered, false otherwise
    func isRegistered () -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: UserPreferences.registered)
    }
    
    func setAccessToken (accessToken: String) {
        let defaults = UserDefaults.standard
        defaults.set(accessToken, forKey: UserPreferences.accessToken)
    }
    
    func getAccessToken () -> String {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: UserPreferences.accessToken)!
    }
    
    func setRefreshToken (refreshToken: String) {
        let defaults = UserDefaults.standard
        defaults.set(refreshToken, forKey: UserPreferences.refreshToken)
    }
    
    func getrefreshToken () -> String? {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: UserPreferences.refreshToken)
    }
    
    func setFCMToken (fcmToken: String?) {
        let defaults = UserDefaults.standard
        defaults.set(fcmToken, forKey: UserPreferences.fcmToken)
    }
    
    func getFCMToken () -> String? {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: UserPreferences.fcmToken)
    }
    
    func setFCMRefreshToken (fcmToken: String?) {
        let defaults = UserDefaults.standard
        defaults.set(fcmToken, forKey: UserPreferences.fcmRefreshToken)
    }
    
    func getFCMRefreshToken () -> String? {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: UserPreferences.fcmRefreshToken)
    }
}
