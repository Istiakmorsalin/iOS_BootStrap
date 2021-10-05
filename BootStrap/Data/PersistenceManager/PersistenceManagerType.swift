//
//  PersistenceManagerType.swift
//   
//
//  Created by Istiak on 4/16/18.
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
