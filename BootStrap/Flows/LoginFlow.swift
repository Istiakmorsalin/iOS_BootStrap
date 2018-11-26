//
//  LoginFlow.swift
//
//  Created by Istiak on 9/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import UIKit.UINavigationController
import RxFlow

class LoginFlow: Flow {
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
        case .login:
            return navigationToLoginScreen()
        case .loginComplete:
            return NextFlowItems.end(withStepForParentFlow: AppStep.loginComplete)
        default:
            return NextFlowItems.none
        }
    }
    
    private func navigationToLoginScreen() -> NextFlowItems {
        let loginService = LoginService()
        let loginServices = LoginServices(loginService: loginService)
        let loginViewController = LoginViewController.instantiate(withViewModel: LoginViewModel(), andServices: loginServices)
        loginViewController.title = "Login"
        self.rootViewController.pushViewController(loginViewController, animated: false)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: loginViewController, nextStepper: loginViewController.viewModel))
    }
}
