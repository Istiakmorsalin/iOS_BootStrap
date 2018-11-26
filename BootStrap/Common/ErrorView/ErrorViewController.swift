//
//  ErrorViewController.swift
//   
//
//  Created by Istiak on 2/9/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation

class ErrorViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet var containerView: UIView!
    
    var errorText: String!
    
    public init(errorText: String) {
        super.init(nibName: "ErrorViewController", bundle: Bundle(for: type(of: self)))
        self.errorText = errorText
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Unsupported initializer, please use init()")
    }
    
    override func viewDidLoad() {
        setupContainerView()
        self.errorLabel.text = errorText
    }
    
    func customContainerViewSetCornerRadius(_ radius: CGFloat) {
        containerView.layer.cornerRadius = radius
    }
    
    private func setupContainerView() {
        containerView.clipsToBounds = true
    }
    
    @IBAction func okButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
