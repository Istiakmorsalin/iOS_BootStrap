//
//  HomeViewModel.swift
//   
//
//  Created by Istiak on 11/16/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import RxFlow
import RxSwift

class HomeViewModel: ServicesViewModel {
    
    typealias Services = HasHomeService
    var services: Services! {
        didSet {
            
        }
    }
    
    let disposeBag = DisposeBag()
    init() {
       
    }
}

extension HomeViewModel: Stepper {
}
