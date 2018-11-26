//
//  SplashService.swift
//   
//
//  Created by Istiak on 8/13/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import RxSwift

protocol HasSplashService {
    var splashService: SplashService { get }
    var preferencesService: PreferencesService { get }
}

struct SplashServices: HasSplashService {
    let splashService: SplashService
    let preferencesService: PreferencesService
}

class SplashService {
    let disposeBag = DisposeBag()
}
