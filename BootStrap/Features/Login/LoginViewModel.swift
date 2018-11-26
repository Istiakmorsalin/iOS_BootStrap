//
//  LoginViewModel.swift
//   
//
//  Created by Istiak on 11/16/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import RxFlow
import RxSwift

class LoginViewModel: ServicesViewModel {
    
    typealias Services = HasLoginService
    var services: Services! {
        didSet {
            
        }
    }
    
    let disposeBag = DisposeBag()
    
    let requestLogin: PublishSubject<LoginParameter>
    let responseLogin: PublishSubject<LoginResponse>
    let responseErrorLogin: PublishSubject<ErrorResponse>
    
    let responseError: PublishSubject<AppError>
    
    init() {
        self.requestLogin = PublishSubject<LoginParameter>()
        self.responseLogin = PublishSubject<LoginResponse>()
        self.responseErrorLogin = PublishSubject<ErrorResponse>()
        self.responseError = PublishSubject<AppError>()
        self.requestLogin.subscribe(self.getLoginRequestObserver()).disposed(by: disposeBag)
    }
    
    func getLoginRequestObserver() -> AnyObserver<LoginParameter> {
        return AnyObserver.init(eventHandler: { [weak self] (event) in
            switch event {
            case .next(let element):
                log.debug(element)
                guard let strongSelf = self else { return }
                strongSelf.services.loginService.requestLogin(param: element).subscribe(strongSelf.getLoginResponseObserver()).disposed(by: strongSelf.disposeBag)
            case .error(let error):
                log.debug(error)
            case .completed:
                log.debug("Completed")
            }
        })
    }
    
    func getLoginResponseObserver() -> AnyObserver<Resource<LoginResponse, ErrorDetails>> {
        return AnyObserver.init(eventHandler: { [weak self] (event) in
            switch event {
            case .next(let element):
                log.debug(element.status)
                
                switch element.status {
                case .loading:
                    log.debug("Status loading")
                case .success:
                    log.debug("Status success")
                    guard let strongSelf = self else { return }
                    strongSelf.responseLogin.on(Event.next(element.data!))
                case .error(let code, let msg):
                    log.debug("Status error: \(String(describing: code)): \(String(describing: msg))")
                    guard let strongSelf = self else { return }
                    let appError = AppError(code: code, msg: msg)
                    strongSelf.responseError.on(Event.next(appError))
                }
            case .error(let error):
                log.debug(error)
            case .completed:
                log.debug("Completed")
            }
        })
    }
}

extension LoginViewModel: Stepper {
    public func navigateToHome() {
        self.step.accept(AppStep.loginComplete)
    }
}
