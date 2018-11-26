//
//  UITableView+Indexpath.swift
//   
//
//  Created by Istiak on 8/11/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit.UITableView

extension UITableView {
    func isValidate(_ indexPath: IndexPath) -> Bool {
        if indexPath.section >= numberOfSections {
            return false
        }
        if indexPath.row >= numberOfRows(inSection: indexPath.section) {
            return false
        }
        return true
    }
}
