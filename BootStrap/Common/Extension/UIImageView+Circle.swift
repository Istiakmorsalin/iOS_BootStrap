//
//  UIImageView+Circle.swift
//
//  Created by Istiak on 2018/09/27.
//

import Foundation
import UIKit

extension UIImageView {

    func applyRoundImage() {
        if self.frame.size.height > self.frame.size.width {
            self.frame.size.height = self.frame.size.width
        } else {
            self.frame.size.width = self.frame.size.height
        }
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
        self.image = UIImage.screenshot(of: self)
    }
}
