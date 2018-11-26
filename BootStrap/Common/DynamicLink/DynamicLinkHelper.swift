//
//  DynamicLink.swift
//   
//
//  Created by Istiak on 9/14/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import Firebase

class DynamicLinkHelper {
    private static let dynamicLinksDomain = DynamicLinkDomain.domain
    private static let baseDeepLink = ApiPath.baseURLString
    private static let messagePath = "/message"
    public static let msgHashQueryItemName = "hash"
    private static let webViewDeepLinkQueryItemName = "webViewDeepLink"
    
    static func createDynamicLinkWithFallbackURL(msgHash: String, completion: @escaping (URL?) -> Void) {
        self.createDynamicLinkWithoutFallbackURL(msgHash: msgHash) { (shortURL) in
            if let dynamicLinkWithOutFailback =  shortURL {
                if let link = self.buildDeepLink(msgHash: msgHash, webViewDeepLink: dynamicLinkWithOutFailback.absoluteString) {
                    let linkBuilder = DynamicLinkComponents(link: link, domain: dynamicLinksDomain)
                    
                    let bundleID = Bundle.main.bundleIdentifier!
                    linkBuilder.iOSParameters = DynamicLinkIOSParameters(bundleID: bundleID)
                    linkBuilder.androidParameters = DynamicLinkAndroidParameters(packageName: bundleID)
                    linkBuilder.iOSParameters?.fallbackURL = link
                    linkBuilder.androidParameters?.fallbackURL = link
                    
                    linkBuilder.navigationInfoParameters = DynamicLinkNavigationInfoParameters()
                    linkBuilder.navigationInfoParameters?.isForcedRedirectEnabled = true
                    
                    if let longDynamicLinkWithFallbackURL = linkBuilder.url {
                        print("The long URL is: \(longDynamicLinkWithFallbackURL)")
                    }
                    
                    linkBuilder.shorten { url, warnings, error in
                        if let _error = error {
                            print("Dynamic link with fallback builder error: \(_error)")
                        }
                        if let _warnings = warnings {
                            print("Dynamic link with fallback builder warnings: \(_warnings)")
                        }
                        if let _url = url {
                            print("The short dynamic link with fallback URL is: \(_url)")
                        }
                        completion(url)
                    }
                }
            }
        }
    }
    
    private static func createDynamicLinkWithoutFallbackURL(msgHash: String, completion: @escaping (URL?) -> Void) {
        if let link = self.buildDeepLink(msgHash: msgHash) {
            let linkBuilder = DynamicLinkComponents(link: link, domain: dynamicLinksDomain)
            
            let bundleID = Bundle.main.bundleIdentifier!
            linkBuilder.iOSParameters = DynamicLinkIOSParameters(bundleID: bundleID)
            linkBuilder.iOSParameters?.appStoreID = "1437249274"
            
            linkBuilder.androidParameters = DynamicLinkAndroidParameters(packageName: bundleID)
            
            linkBuilder.shorten { url, warnings, error in
                if let _error = error {
                    print("Dynamic link without fallback builder error: \(_error)")
                }
                if let _warnings = warnings {
                    print("Dynamic link without fallback builder warnings: \(_warnings)")
                }
                if let _url = url {
                    print("The short dynamic link without fallback URL is: \(_url)")
                }
                completion(url)
            }
        }
    }
    
    private static func buildDeepLink(msgHash: String, webViewDeepLink: String? = nil) -> URL? {
        var queryItems = [URLQueryItem]()
        var urlComponents = URLComponents(string: self.baseDeepLink)
        urlComponents?.path = self.messagePath
        
        let msgHashQueryItem = URLQueryItem(name: msgHashQueryItemName, value: msgHash)
        queryItems.append(msgHashQueryItem)

        if webViewDeepLink != nil {
            let webViewDeepLinkQueryItem = URLQueryItem(name: webViewDeepLinkQueryItemName, value: webViewDeepLink)
            queryItems.append(webViewDeepLinkQueryItem)
        }
        
        urlComponents?.queryItems = queryItems
        
        return urlComponents?.url
    }
    
    static func handleLink(fromCustomSchemeURL: URL, completion: @escaping ([String: String]?) -> Void) -> Bool {
        if let dynamicLink = DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: fromCustomSchemeURL) {
            self.handleIncomingDynamicLink(dynamicLink: dynamicLink, completion: completion)
            return true
        }
        return false
    }
    
    static func handleLink(userActivity: NSUserActivity, completion: @escaping ([String: String]?) -> Void) -> Bool {
        if let incomingURL = userActivity.webpageURL {
            let linkHandled = DynamicLinks.dynamicLinks().handleUniversalLink(incomingURL) {(dynamicLink, error) in
                print("Incoming dynamic link error: \(String(describing: error))")
                if let dynamicLink = dynamicLink, let dynamicLinkURL = dynamicLink.url {
                    print("Incoming dynamic link URL: \(dynamicLinkURL)")
                    handleIncomingDynamicLink(dynamicLink: dynamicLink, completion: completion)
                } else {
                    completion(nil)
                }
            }
            return linkHandled
        }
        return false
    }
    
    private static func handleIncomingDynamicLink(dynamicLink: DynamicLink, completion: @escaping ([String: String]?) -> Void) {
        if dynamicLink.matchType == .weak {
            print("Incoming dynamic link is invalid")
        } else {
            if let incomingLink = dynamicLink.url {
                print("Incoming dynamic link: \(incomingLink)")
                let queryParameters = getQueryParameters(url: incomingLink)
                print("queryParameters: \(String(describing: queryParameters))")
                completion(queryParameters)
            } else {
                completion(nil)
            }
        }
    }
    
    private static func getQueryParameters(url: URL) -> [String: String]? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true), let queryItems = components.queryItems else {
            return nil
        }
        //let path = components.path
        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }
        //parameters["msgHash"] = String(path.dropFirst())
        return parameters
    }
}
