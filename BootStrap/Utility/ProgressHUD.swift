//
//  ProgressHUD.swift
//  Lylink
//
//  Created by Mohammed Rokon Uddin on 31/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import RappleProgressHUD

class ProgressHUD {
    private static let timeOut: TimeInterval = 1

    static func showProccessHUD(withOverlay overlay: Bool = true, andDuration duration: Double? = nil) {
        GIFHUD.shared.show(withOverlay: overlay, duration: duration)
    }

    static func stopHUD() {
        GIFHUD.shared.dismiss {
            
        }
    }

    static func stopHUDWithSuccess(message: String?) {
        RappleActivityIndicatorView.stopAnimation(completionIndicator: .success, completionLabel: message, completionTimeout: ProgressHUD.timeOut)
    }

    static func stopHUDWithFail(message: String?) {
        RappleActivityIndicatorView.stopAnimation(completionIndicator: .failed, completionLabel: message, completionTimeout: ProgressHUD.timeOut)
    }
}
