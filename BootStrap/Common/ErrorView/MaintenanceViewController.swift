//
//  MaintenanceViewController.swift
//   
//
//  Created by Istiak on 9/10/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

class MaintenanceViewController: UIViewController {
    @IBOutlet private weak var containerView: UIView!
    
    public init() {
        super.init(nibName: "MaintenanceViewController", bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
    }
}
