//
//  CommonWebViewModel.swift
//   
//
//  Created by Istiak on 9/6/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

import Foundation
import RxFlow

class CommonWebViewModel: ViewModel {
    
    let title: String
    let urlString: String
    
    init(webModel: CommonWebModel) {
        self.title = webModel.title
        self.urlString = webModel.urlString
    }
    
    var url: URL? {
        return URL(string: urlString)
    }
    
    var request: URLRequest? {
        guard let _url = url else {return nil}
        return URLRequest(url: _url)
    }
    
}

struct CommonWebModel {
    let title: String
    let urlString: String
}

extension CommonWebViewModel: Stepper {
}
