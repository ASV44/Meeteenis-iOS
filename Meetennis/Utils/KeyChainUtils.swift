//
//  FileUtils.swift
//  Meetennis
//
//  Created by Hackintosh on 2/6/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit
import KeychainSwift

class KeyChainUtils {
    
    private static let keychain = KeychainSwift(keyPrefix: "JWToken_")
    private static let userDefaults = UserDefaults.standard
    private static let LAST_PROVIDER_KEY = "lastProvider"
    
    static func set(access token: String, for provider: String) {
        keychain.set(token, forKey: provider)
    }
    
    static func getAccesToken(for provider: String) -> String! {
        return keychain.get(provider)
    }
    
    static func getAccesToken() -> String! {
        if let lastProvider = userDefaults.string(forKey: LAST_PROVIDER_KEY) {
            return keychain.get(lastProvider)
        }
        
        return nil
    }

    static func updateLastProvider(_ provider: String) {
        userDefaults.set(provider, forKey: LAST_PROVIDER_KEY)
    }
    
    static func removeLastProvider() {
        userDefaults.removeObject(forKey: LAST_PROVIDER_KEY)
    }
    
    static func clearKeyChain() {
        keychain.clear()
    }
}
