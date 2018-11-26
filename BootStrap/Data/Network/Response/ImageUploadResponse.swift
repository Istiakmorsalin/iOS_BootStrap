//
//  CreatePhraseResponse.swift
//   
//
//  Created by Istiak on 7/20/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

struct ImageUploadResponse: Codable {
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
    }
}
