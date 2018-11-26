//
//  LoginServices.swift
//
//  Created by Istiak on 11/16/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import RxSwift

protocol HasLoginService {
    var loginService: LoginService { get }
}

struct LoginServices: HasLoginService {
    let loginService: LoginService
}

class LoginService {
    let disposeBag = DisposeBag()
    
    func requestLogin(param: LoginParameter) -> Observable<Resource<LoginResponse, ErrorDetails>> {
        let loginResponseSubject = PublishSubject<Resource<LoginResponse, ErrorDetails>>()
        
        let observable: Observable<Response> = AuthAPIClient.login(parameters: param.param())
        
        let subscription = observable.subscribe { event in
            switch event {
            case .next(let response):
                switch response.status {
                    
                case .success:
                    if let responseData = response.data {
                        do {
                            let response = try JSONDecoder().decode(LoginResponse.self, from: responseData)
                            loginResponseSubject.onNext(Resource.success(data: response))
                        } catch let error {
                            log.debug(error)
                        }
                    }
                case .error(let error):
                    if let responseData = response.data {
                        do {
                            let response = try JSONDecoder().decode(ErrorDetails.self, from: responseData)
                            loginResponseSubject.onNext(Resource.error(code: error.code, msg: error.description, error: response))
                        } catch let error {
                            log.debug(error)
                        }
                    } else {
                        loginResponseSubject.onNext(Resource.error(code: error.code, msg: error.description, error: nil))
                    }
                }
            case .completed:
                log.debug("HostAPIClient On Complete")
            case .error(let error):
                log.debug(error)
            }
        }
        subscription.disposed(by: self.disposeBag)
        
        return loginResponseSubject.do(onSubscribed: {
            loginResponseSubject.onNext(Resource.loading())
        })
    }
    
}
