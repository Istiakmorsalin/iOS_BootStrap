//
//  UIImage+Circle.swift
//
//  Created by Istiak on 2018/11/01.
//  Copyright © 2018年 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

extension UIImage {
    static func screenshot(of view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.layer.frame.size, false, 0)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let capturedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return capturedImage
    }
}
