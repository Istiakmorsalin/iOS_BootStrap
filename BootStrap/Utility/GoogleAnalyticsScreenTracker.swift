//
//  GoogleAnalyticsScreenTracker.swift
//   
//
//  Created by Istiak on 7/11/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

class GoogleAnalyticsScreenTracker {
    
    static func trackScreen(name: String) {
        // The UA-XXXXX-Y tracker ID is loaded automatically from the
        // GoogleService-Info.plist by the `GGLContext` in the AppDelegate.
        // If you're copying this to an app just using Analytics, you'll
        // need to configure your tracking ID here.
        // [START screen_view_hit_swift]
        GAI.sharedInstance().logger.logLevel = GAILogLevel.error
        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
        
        tracker.set(kGAIScreenName, value: name)
        
        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
        tracker.send(builder.build() as [NSObject : AnyObject])
        // [END screen_view_hit_swift]
    }
}
