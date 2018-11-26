//
//  SplashViewController.swift
//
//  Created by Istiak on 8/13/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import Reusable
import Reachability

class SplashViewController: UIViewController, StoryboardBased, ViewModelBased {
    var viewModel: SplashViewModel!
    
    override func viewDidLoad() {
        self.bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.viewModel.splashComplete()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    private func bindViewModel() {
        
    }
}
