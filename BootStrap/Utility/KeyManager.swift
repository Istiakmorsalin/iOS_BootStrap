//
//
//  Created by Istiak on 4/17/18.
//  Copyright © 2018 mlbd. All rights reserved.
//

import Foundation

class KeyManager {
    var keys: NSDictionary?
    var fabricApiKey: String = ""
    var googleAnalyticsTrackingID: String = ""
    var adMobAppID: String = ""
    var adUnitID: String = ""
    var appsFlyerDevKey: String = ""
    var appAppleID: String = ""
    
    public func provideFabricApiKey() -> String {
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        if let fabricApiKeys = keys {
            fabricApiKey = (fabricApiKeys["FabricAPIKey"] as? String)!
        }
        return fabricApiKey
  }
    
    public func provideGoogleAnalyticsID() -> String {
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        if let apiKeys = keys {
            googleAnalyticsTrackingID = (apiKeys["GoogleAnalyticsTrackingID"] as? String)!
        }
        return googleAnalyticsTrackingID
    }
    
    public func provideAdMobAppID() -> String {
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        if let apiKeys = keys {
            adMobAppID = (apiKeys["AdmobAppID"] as? String)!
        }
        return adMobAppID
    }
    
    public func provideAdMobAddID() -> String {
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        if let apiKeys = keys {
            adUnitID = (apiKeys["adUnitID"] as? String)!
        }
        return adUnitID
    }
    
    public func provideAppsFlyerDevKey() -> String {
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        if let apiKeys = keys {
            appsFlyerDevKey = (apiKeys["AppsFlyerDevKey"] as? String)!
        }
        return appsFlyerDevKey
    }
    
    public func provideAppAppleID() -> String {
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        if let apiKeys = keys {
            appAppleID = (apiKeys["AppAppleID"] as? String)!
        }
        return appAppleID
    }
}
