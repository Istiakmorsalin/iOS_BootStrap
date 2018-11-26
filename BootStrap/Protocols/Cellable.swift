//
//  Cellable.swift
//   
//
//  Created by Istiak on 12/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

protocol Cellable {

    static var id: String { get }
    static var cellNib: UINib { get }
}

extension Cellable {

    static var id: String {
        return String(describing: Self.self)
    }

    static var cellNib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
}
