//
//  UIView+Extension.swift
//   
//
//  Created by Istiak on 9/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

extension UIView {
    func snapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }

    /** Loads instance from nib with the same name. */

    func loadNib() {
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
    }

    func addSubViewToBounds(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false

        let horizontalConstraint = NSLayoutConstraint(item: view,
                                                      attribute: NSLayoutConstraint.Attribute.leading,
                                                      relatedBy: NSLayoutConstraint.Relation.equal,
                                                      toItem: self,
                                                      attribute: NSLayoutConstraint.Attribute.leading,
                                                      multiplier: 1,
                                                      constant: 0)

        let verticalConstraint = NSLayoutConstraint(item: view,
                                                    attribute: NSLayoutConstraint.Attribute.top,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: self,
                                                    attribute: NSLayoutConstraint.Attribute.top,
                                                    multiplier: 1,
                                                    constant: 0)

        let trailingConstraint = NSLayoutConstraint(item: view,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: self,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: 0)

        let bottomConstraint = NSLayoutConstraint(item: view,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  multiplier: 1,
                                                  constant: 0)

        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, trailingConstraint, bottomConstraint])
    }
}

extension UIView {
    var visibleRect: CGRect? {
        guard let superview = superview else { return nil }
        return frame.intersection(superview.bounds)
    }
}
