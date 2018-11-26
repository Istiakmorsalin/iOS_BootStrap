//
//  NetworkManager.swift
//   
//
//  Created by mlbd on 10/23/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import Reachability

class NetworkStatusManager: NSObject {
    
    var reachability: Reachability!
    
    // Create a singleton instance
    static let sharedInstance: NetworkStatusManager = { return NetworkStatusManager() }()
    
    override init() {
        super.init()
        
        // Initialise reachability
        reachability = Reachability()!
        
        // Register an observer for the network status
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkStatusChanged(_:)),
            name: .reachabilityChanged,
            object: reachability
        )
        
        do {
            // Start the network status notifier
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    @objc func networkStatusChanged(_ notification: Notification) {
        // Do something globally here!
        log.debug("Network status changed")
    }
    
    static func stopNotifier() -> Void {
        do {
            // Stop the network status notifier
            try (NetworkStatusManager.sharedInstance.reachability).startNotifier()
        } catch {
            print("Error stopping notifier")
        }
    }
    
    // Network is reachable
    static func isReachable(completed: @escaping (NetworkStatusManager) -> Void) {
        if (NetworkStatusManager.sharedInstance.reachability).connection != .none {
            completed(NetworkStatusManager.sharedInstance)
        }
    }
    
    // Network is unreachable
    static func isUnreachable(completed: @escaping (NetworkStatusManager) -> Void) {
        if (NetworkStatusManager.sharedInstance.reachability).connection == .none {
            completed(NetworkStatusManager.sharedInstance)
        }
    }
    
    // Network is reachable via WWAN/Cellular
    static func isReachableViaWWAN(completed: @escaping (NetworkStatusManager) -> Void) {
        if (NetworkStatusManager.sharedInstance.reachability).connection == .cellular {
            completed(NetworkStatusManager.sharedInstance)
        }
    }
    
    // Network is reachable via WiFi
    static func isReachableViaWiFi(completed: @escaping (NetworkStatusManager) -> Void) {
        if (NetworkStatusManager.sharedInstance.reachability).connection == .wifi {
            completed(NetworkStatusManager.sharedInstance)
        }
    }
}
