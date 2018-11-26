//
//  UITableView+Extra.swift
//   
//
//  Created by Istiak on 18/9/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

extension UITableView {
    func isLastCell(indexPath: IndexPath) -> Bool {
        let totalSections = numberOfSections
        let totalRowForSection = numberOfRows(inSection: indexPath.section)
        if (indexPath.section == totalSections - 1)
            && (indexPath.row == totalRowForSection - 1 ) {
            return true
        }
        return false
    }

    func isLastCellForSection(indexPath: IndexPath) -> Bool {
        let totalRowForSection = numberOfRows(inSection: indexPath.section)
        if (indexPath.row == totalRowForSection - 1 ) {
            return true
        }
        return false
    }
}
