//
//  ErrorDetails.swift
//   
//
//  Created by Istiak on 7/24/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

struct ErrorDetails: Codable {
    let code: Int
    let error: String
    let displayText: String
}
