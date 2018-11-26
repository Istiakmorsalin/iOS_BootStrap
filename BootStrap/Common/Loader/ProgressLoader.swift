//
//  ProgressLoader.swift
//   
//
//  Created by Istiak on 2/9/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import Gifu

class ProgressLoader {
    let window = UIApplication.shared.keyWindow!
    weak var viewController: UIViewController?
    var progressLoaderView: UIView
    let loaderImageView = GIFImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
    
    init(viewController: UIViewController, color: UIColor = UIColor.white, isTopBarHidden: Bool = false) {
        self.viewController = viewController
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
       
        var topBarHeight: CGFloat = !isTopBarHidden ? statusBarHeight : 0.0
        
        if let navigationController = viewController.navigationController {
            
         if !navigationController.isNavigationBarHidden {
             topBarHeight = statusBarHeight + navigationController.navigationBar.frame.height
           }
        }
        
        self.progressLoaderView = UIView(frame: CGRect(x: window.frame.origin.x, y: window.frame.origin.y, width: window.frame.width, height: window.frame.height - topBarHeight))
        self.progressLoaderView.backgroundColor = color
        loaderImageView.prepareForAnimation(withGIFNamed: "loader")
        self.progressLoaderView.addSubview(loaderImageView)
        self.loaderImageView.center = window.center
    }
    
    func showLoader() {
        self.viewController?.view.addSubview(progressLoaderView)
        loaderImageView.startAnimatingGIF()
    }
    
    func hideLoader() {
        loaderImageView.stopAnimatingGIF()
        progressLoaderView.removeFromSuperview()
    }
}
