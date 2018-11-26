//
//  SplashFlow.swift
//   
//
//  Created by Istiak on 8/13/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import UIKit.UINavigationController
import RxFlow

class SplashFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        viewController.isNavigationBarHidden = true
        return viewController
    }()
    
    private let services: AppServices
    
    init(withServices services: AppServices) {
        self.services = services
    }
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? AppStep else { return NextFlowItems.none }
        
        switch step {
        case .splash:
            return navigationToSplashScreen()
        case .splashIsComplete:
            return NextFlowItems.end(withStepForParentFlow: AppStep.splashIsComplete)
        default:
            return NextFlowItems.none
        }
    }
    
    private func navigationToSplashScreen() -> NextFlowItems {
        let splashService = SplashService()
        let preferencesService = PreferencesService()
        let splashServices = SplashServices(splashService: splashService, preferencesService: preferencesService)
        let splashViewController = SplashViewController.instantiate(withViewModel: SplashViewModel(), andServices: splashServices)  
        self.rootViewController.pushViewController(splashViewController, animated: false)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: splashViewController, nextStepper: splashViewController.viewModel))
    }
}
