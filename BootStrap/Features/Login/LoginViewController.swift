//
//  LoginViewController.swift
//   
//
//  Created by Istiak on 11/16/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit
import Reusable
import RxSwift
import IQKeyboardManagerSwift

class LoginViewController: UIViewController,StoryboardBased, ViewModelBased {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func doLogin(_ sender: Any) {
        _ = LoginParameter(email: email.text!, password: password.text!)
        //viewModel.requestLogin.onNext(param)
        self.viewModel.navigateToHome()
    }
    private func bindViewModel() {
        viewModel.responseLogin.subscribe({(event) in
            switch event {
            case .next(let element):
                log.debug(element)
            case .error(let error):
//                self.progressLoader.hideLoader()
                log.debug(error)
            case .completed:
//                self.progressLoader.hideLoader()
                log.debug("completed")
            }
        }).disposed(by: disposeBag)
        
    }
}
