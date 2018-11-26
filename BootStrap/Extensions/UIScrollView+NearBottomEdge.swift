//
//  UIScrollView+NearBottomEdge.swift
//   
//
//  Created by Rokon Uddin on 8/3/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

extension UIScrollView {
    func  isNearBottomEdge(edgeOffset: CGFloat = 20.0) -> Bool {
        return self.contentOffset.y + self.frame.size.height + edgeOffset > self.contentSize.height
    }
}

extension UITableView {
    var isScrolledToBottom: Bool {
        return self.contentOffset.y + self.frame.size.height == self.contentSize.height
    }
}
