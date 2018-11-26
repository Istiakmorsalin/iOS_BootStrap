//
//  UIView+Frame.swift
//   
//
//  Created by Istiak on 9/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

extension UIView {
    //swiftlint:disable all
    public var x: CGFloat {
        get { return self.frame.origin.x }
        set(v) { self.frame.origin.x = v }
    }

    public var y: CGFloat {
        get { return self.frame.origin.y }
        set(v) { self.frame.origin.y = v }
    }

    public var w: CGFloat {
        get { return self.frame.size.width }
        set(v) { self.frame.size.width = v }
    }

    public var h: CGFloat {
        get { return self.frame.size.height }
        set(v) { self.frame.size.height = v }
    }
}
