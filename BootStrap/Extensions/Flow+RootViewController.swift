//
//  Flow+RootViewController.swift
//   
//
//  Created by Rokon Uddin on 11/10/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import RxFlow

extension Flow {
    func popToMasterViewController(animated: Bool = true) -> NextFlowItems {
        guard let _root = root as? UINavigationController else {
            return NextFlowItems.none
        }
        _root.popToRootViewController(animated: animated)
        return .none
    }

    func popViewController(animated: Bool = true) -> NextFlowItems {
        guard let _root = root as? UINavigationController else {
            return NextFlowItems.none
        }
        _root.popViewController(animated: animated)
        return .none
    }
}
