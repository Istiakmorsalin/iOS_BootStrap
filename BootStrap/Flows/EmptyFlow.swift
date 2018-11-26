//
//  EmptyFlow.swift
//   
//
//  Created by Istiak on 24/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import RxFlow
import RxSwift
import UIKit

class EmptyFlow: Flow {
    let rootViewController = UIViewController()
    var root: Presentable {
        return self.rootViewController
    }
    func navigate(to step: Step) -> NextFlowItems {
        return .none
    }
}

class EmptyStepper: Stepper {
    
}
