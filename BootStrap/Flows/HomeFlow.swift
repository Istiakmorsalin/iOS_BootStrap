//
//  HomeFlow.swift
//
//  Created by Istiak on 8/13/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import UIKit.UINavigationController
import RxFlow

class HomeFlow: Flow {
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
        case .home:
            return navigationToHomeScreen()
        case .splashIsComplete:
            return NextFlowItems.end(withStepForParentFlow: AppStep.splashIsComplete)
        default:
            return NextFlowItems.none
        }
    }
    
    private func navigationToHomeScreen() -> NextFlowItems {
        let homeService = HomeService()
        let homeServices = HomeServices(homeService: homeService)
        let homeViewController = HomeViewController.instantiate(withViewModel: HomeViewModel(), andServices: homeServices)
        homeViewController.title = "Home"
        self.rootViewController.pushViewController(homeViewController, animated: false)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: homeViewController, nextStepper: homeViewController.viewModel))
    }
}
