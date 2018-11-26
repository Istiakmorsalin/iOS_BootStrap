//
//  PersistenceManagerType.swift
//   
//
//  Created by Istiak on 4/16/18.
//  Copyright © 2018 mlbd. All rights reserved.
//

import Foundation

protocol PersistenceManagerType {
    
    func saveAccessToken(token: String)
    func accessToken() -> String?
    func removeAccessToken() throws
    func removeRefreshToken() throws
    
    func saveRefreshToken(refreshToken: String)
    func refreshToken() -> String?
    
    func saveFirstLaunchFlag(flag: Bool)
    func firstLaunchFlag() -> Bool
}
