//
//  Persistence Manager.swift
//   
//
//  Created by Istiak on 12/4/18.
//  Copyright © 2018 mlbd. All rights reserved.
//

import Foundation
import KeychainAccess

class PersistenceManager: PersistenceManagerType {

    static let shared = PersistenceManager()
    private let keychain: Keychain
    private let defaults: UserDefaults
    var paths: String {
        return (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString)
            .appendingPathComponent(" ")
    }

    private init () {
        keychain = Keychain()
        defaults = UserDefaults.standard
    }

    public func saveAccessToken(token: String) {
        do {
            try keychain.set(token, key: Constants.accessToken)
        } catch let error {
             log.debug(error)
        }
    }

    public func accessToken() -> String? {
        do {
            return try keychain.get(Constants.accessToken)
        } catch let error {
            log.debug(error)
            return nil
        }
    }
    
    public func removeAccessToken() throws {
        do {
            try keychain.remove(Constants.accessToken)

        } catch let error {
             log.debug(error)
            throw error
        }
    }
    
    public func removeRefreshToken() throws {
        do {
            try keychain.remove(Constants.refreshToken)
        } catch let error {
             log.debug(error)
            throw error
        }
    }

    public func saveRefreshToken(refreshToken: String) {
        do {
            try keychain.set(refreshToken, key: Constants.refreshToken)
        } catch let error {
             log.debug(error)
        }
    }

    public func refreshToken() -> String? {
        do {
            return try keychain.get(Constants.refreshToken)
        } catch let error {
             log.debug(error)
            return nil
        }
    }

    public func deletePersistentData() -> Bool {
        do {
            try removeAccessToken()
            try removeRefreshToken()
            return true
        } catch _ {
            return false
        }
    }
    
    public func saveTextInput(input: String) {
        do {
            try keychain.set(input, key: Constants.textInput)
        } catch let error {
            log.debug(error)
        }
    }
    
    public func removeTextInput() {
        do {
            try keychain.remove(Constants.textInput)
        } catch let error {
            log.debug(error)
        }
    }
    
    public func getTextInput() -> String? {
        do {
            return try keychain.get(Constants.textInput)
        } catch let error {
            log.debug(error)
            return nil
        }
    }

    public var isDataDeleted: Bool {
        return deletePersistentData()
    }

    func saveFirstLaunchFlag(flag: Bool) {
        defaults.set(flag, forKey: Constants.firstLaunchFlag)
    }
    
    func firstLaunchFlag() -> Bool {
        let flag = defaults.bool(forKey: Constants.firstLaunchFlag)
        return flag
    }

    func saveUser(_ user: User) {
        defaults.set(user.id, forKey: Constants.id)
        defaults.set(user.loginID, forKey: Constants.loginID)
        defaults.set(user.permissionLevel, forKey: Constants.permissionLevel)
    }

    func saveNickName(_ nickName: String) {
        defaults.set(nickName, forKey: Constants.nickName)
    }

    func getNickName() -> String? {
        return defaults.string(forKey: Constants.nickName)
    }
    
    func saveUserPhotoUrl(_ photoUrl: String?) {
        defaults.set(photoUrl, forKey: Constants.photoUrl)
    }
    
    func getUserPhotoUrl() -> String? {
        return defaults.string(forKey: Constants.photoUrl)
    }

    func getUser() -> User? {
        guard let loginID = defaults.string(forKey: Constants.loginID) else { return nil }
        let id = defaults.integer(forKey: Constants.id)
        let permissionLevel = defaults.integer(forKey: Constants.permissionLevel)
        return User(id: id, loginID: loginID, permissionLevel: permissionLevel)
    }

    func getPathForImage(_ name: String ) -> String? {
        let fileManager = FileManager.default
        let fff = paths as NSString
        let path = fff.appendingPathComponent(name)
        if fileManager.fileExists(atPath: path) {
            return path
        } else {
            return nil
        }
    }

    func saveImage(_ image: UIImage, name: String) {
        let fileManager = FileManager.default
        let path = paths as NSString
        let imageData = UIImageJPEGRepresentation(image, 0.5)
        fileManager.createFile(atPath: path.appendingPathComponent(name) as String, contents: imageData, attributes: nil)
    }

    func createDirectory() {
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: paths) {
            try? fileManager.createDirectory(atPath: paths, withIntermediateDirectories: true, attributes: nil)
        }
    }
}
