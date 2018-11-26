//
//  UserServices.swift
//   
//
//  Created by Istiak on 9/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import RxSwift

protocol HasUserService {
    var userService: UserService { get }
}

struct UserServices: HasUserService {
    let userService: UserService
}

class UserService {
    let disposeBag = DisposeBag()
    
    func requestUploadImage(param: ImageUploadParameter, apiRouter: APIRouter) -> Observable<Resource<ImageUploadResponse, ImageUploadErrorResponse>> {
        let createResponseSubject = PublishSubject<Resource<ImageUploadResponse, ImageUploadErrorResponse>>()
        let observable: Observable<Response> = HostAPIClient.uploadImage(data: param, apiRouter: apiRouter)
        
        let subscription = observable.subscribe { event in
            switch event {
            case .next(let response):
                switch response.status {
                    
                case .success:
                    if let responseData = response.data {
                        do {
                            let response = try JSONDecoder().decode(ImageUploadResponse.self, from: responseData)
                            createResponseSubject.onNext(Resource.success(data: response))
                        } catch let error {
                            log.debug(error)
                        }
                    }
                case .error(let error):
                    if let responseData = response.data {
                        do {
                            let response = try JSONDecoder().decode(ImageUploadErrorResponse.self, from: responseData)
                            createResponseSubject.onNext(Resource.error(code: error.code, msg: error.description, error: response))
                        } catch let error {
                            log.debug(error)
                        }
                    }
                }
            case .completed:
                log.debug("HostAPIClient On Complete")
            case .error(let error):
                log.debug(error)
            }
        }
        subscription.disposed(by: self.disposeBag)
        
        return createResponseSubject.do(onSubscribed: {
            createResponseSubject.onNext(Resource.loading())
        })
    }
    
    func requestUpdateUser(param: UserUpdateParameter) -> Observable<Resource<UserUpdateResponse, ErrorDetails>> {
        let updateUserResponseSubject = PublishSubject<Resource<UserUpdateResponse, ErrorDetails>>()
        
        let observable: Observable<Response> = HostAPIClient.updateUser(parameters: param.param())
        
        let subscription = observable.subscribe { event in
            switch event {
            case .next(let response):
                switch response.status {
                    
                case .success:
                    if let responseData = response.data {
                        do {
                            let response = try JSONDecoder().decode(UserUpdateResponse.self, from: responseData)
                            updateUserResponseSubject.onNext(Resource.success(data: response))
                        } catch let error {
                            log.debug(error)
                        }
                    }
                case .error(let error):
                    if let responseData = response.data {
                        do {
                            let response = try JSONDecoder().decode(ErrorDetails.self, from: responseData)
                            updateUserResponseSubject.onNext(Resource.error(code: error.code, msg: error.description, error: response))
                        } catch let error {
                            log.debug(error)
                        }
                    } else {
                        updateUserResponseSubject.onNext(Resource.error(code: error.code, msg: error.description, error: nil))
                    }
                }
            case .completed:
                log.debug("HostAPIClient On Complete")
            case .error(let error):
                log.debug(error)
            }
        }
        subscription.disposed(by: self.disposeBag)
        
        return updateUserResponseSubject.do(onSubscribed: {
            updateUserResponseSubject.onNext(Resource.loading())
        })
    }
    
}
