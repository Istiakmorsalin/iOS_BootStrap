//
//  ImageUploadParameter.swift
//   
//
//  Created by Istiak on 7/20/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

public class ImageUploadParameter: Parameterizable {
    public let imageData: Data
    public let imageName: String

    enum CodingKeys: String {
        case imageData
        case imageName
    }

    public init(imageData: Data, imageName: String) {
        self.imageData = imageData
        self.imageName = imageName
    }

    func param() -> [String : Any] {
        let dictionaryParams : [String : Any?] = [
            CodingKeys.imageData.rawValue : self.imageData,
            CodingKeys.imageName.rawValue : self.imageName
            ]

        let fixedParam = dictionaryParams.filter {(_, v) in v != nil }.mapValues { v in return v!}

        return fixedParam
    }
}
