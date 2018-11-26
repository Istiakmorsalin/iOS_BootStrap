//
//  CreatePhraseErrorResponse.swift
//   
//
//  Created by Istiak on 7/24/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

struct ImageUploadErrorResponse: Codable {
    let error: String
    
    enum CodingKeys: String, CodingKey {
        case  error
    }
}
