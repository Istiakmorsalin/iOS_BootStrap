//
//  SplashViewModel.swift
//   
//
//  Created by Istiak on 8/13/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import RxFlow
import RxSwift

class SplashViewModel: ServicesViewModel {
    typealias Services = SplashServices
    var services: Services!
    let disposeBag = DisposeBag()
    
    init() {

    }
}

extension SplashViewModel: Stepper {
    func splashComplete() {
        services.preferencesService.setSplashing()
        self.step.accept(AppStep.splashIsComplete)
    }
}
