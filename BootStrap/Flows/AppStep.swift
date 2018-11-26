//
//  AppStep.swift
//   
//
//  Created by Istiak on 9/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import RxFlow

enum AppStep: Step {
    case splash
    case splashIsComplete
    
    case login
    case loginComplete
    
    case home
    case homeComplete
    
    case commonWebView(commonWebModel: CommonWebModel)
    case commonWebViewComplete
}
