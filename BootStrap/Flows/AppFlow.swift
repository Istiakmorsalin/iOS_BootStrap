//
//  AppFlow.swift
//   
//
//  Created by Istiak on 9/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit
import RxFlow

class AppFlow: Flow {
    private let rootWindow: UIWindow
    private let services: AppServices
    var root: Presentable {
        return self.rootWindow
    }

    init(withWindow window: UIWindow, andServices services: AppServices) {
        self.rootWindow = window
        self.services = services
    }

    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? AppStep else { return NextFlowItems.none}
        switch step {
        case .splash:
            return navigationToSplashScreen()
        case .splashIsComplete:
            return onSplashComplete()
        case .loginComplete:
            return navigationToHomeScreen()
        default:
            return NextFlowItems.none
        }
    }

    private func navigationToSplashScreen () -> NextFlowItems {
        let spalshFlow = SplashFlow(withServices: self.services)
        Flows.whenReady(flow1: spalshFlow) { [unowned self] (root) in
            self.rootWindow.rootViewController = root
        }
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: spalshFlow, nextStepper: OneStepper(withSingleStep: AppStep.splash)))
    }
    
    private func navigationToLoginScreen () -> NextFlowItems {
        let loginFlow = LoginFlow(withServices: self.services)
        Flows.whenReady(flow1: loginFlow) { [unowned self] (root) in
            self.rootWindow.rootViewController = root
        }
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: loginFlow, nextStepper: OneStepper(withSingleStep: AppStep.login)))
    }
    
    private func navigationToHomeScreen () -> NextFlowItems {
        let homeFlow = HomeFlow(withServices: self.services)
        Flows.whenReady(flow1: homeFlow) { [unowned self] (root) in
            self.rootWindow.rootViewController = root
        }
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: homeFlow, nextStepper: OneStepper(withSingleStep: AppStep.home)))
    }
    
    private func onSplashComplete() -> NextFlowItems {
       return navigationToLoginScreen()
    }
}

class AppStepper: Stepper {
    init(withServices services: AppServices) {
        self.step.accept(AppStep.splash)
    }
}
