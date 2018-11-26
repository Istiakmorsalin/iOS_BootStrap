//
//  AdBannerHelper.swift
//
//
//  Created by Istiak on 9/19/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import GoogleMobileAds
import SnapKit
import UIKit

class AdBannerHelper {
    static let keyManager = KeyManager()
    
   // static let adUnitID = "ca-app-pub-3940256099942544/2934735716"

    static func addBannerView(rootViewController: UIViewController, adBannerHeight: UInt = 50) -> GADBannerView {
        let adUnitID = keyManager.provideAdMobAddID()
        let bannerView: GADBannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = rootViewController
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        rootViewController.view.addSubview(bannerView)
        bannerView.snp.makeConstraints { (make) -> Void in
            make.size.height.equalTo(adBannerHeight)
            make.left.equalTo(rootViewController.view)
            make.right.equalTo(rootViewController.view)
            make.bottom.equalTo(rootViewController.bottomLayoutGuide.snp.top)
        }
        bannerView.load(GADRequest())
        
        return bannerView
    }
}
