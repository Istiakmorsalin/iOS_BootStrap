//
//  HomeServices.swift
//
//  Created by Istiak on 11/16/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import RxSwift

protocol HasHomeService {
    var homeService: HomeService { get }
}

struct HomeServices: HasHomeService {
    let homeService: HomeService
}

class HomeService {
    let disposeBag = DisposeBag()
}
