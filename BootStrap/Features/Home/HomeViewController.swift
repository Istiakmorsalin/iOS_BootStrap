//
//  HomeViewController.swift
//   
//
//  Created by Istiak on 11/16/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit
import Reusable
import RxSwift
import IQKeyboardManagerSwift

class HomeViewController: UIViewController,StoryboardBased, ViewModelBased {
    
    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = false
        GoogleAnalyticsScreenTracker.trackScreen(name: Screens.tu01InputNickNameScreen.rawValue)
    }

    private func bindViewModel() {
        
    }
}
