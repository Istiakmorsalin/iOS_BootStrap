//
//  UICollectionView+Indexpath.swift
//   
//
//  Created by Rokon Uddin on 11/3/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit.UICollectionView

extension UICollectionView {
    func isValidate(_ indexPath: IndexPath) -> Bool {
        if indexPath.section >= numberOfSections {
            return false
        }
        if indexPath.row >= numberOfItems(inSection: indexPath.section) {
            return false
        }
        return true
    }
}
