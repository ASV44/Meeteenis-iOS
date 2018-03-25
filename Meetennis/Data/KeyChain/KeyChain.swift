//
//  FileUtils.swift
//  Meetennis
//
//  Created by Hackintosh on 2/6/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import KeychainSwift

class KeyChain {
    
    private let keychain: KeychainSwift
    private let userDefaults: UserDefaults
    private let LAST_PROVIDER_KEY = "lastProvider"
    
    init() {
        self.keychain = KeychainSwift(keyPrefix: "JWToken_")
        self.userDefaults = UserDefaults.standard
    }
    
    func set(access token: String, for provider: String) {
        keychain.set(token, forKey: provider)
        updateLastProvider(provider)
    }
    
    func getAccesToken(for provider: String) -> String! {
        return keychain.get(provider)
    }
    
    func getAccesToken() -> String! {
        if let lastProvider = userDefaults.string(forKey: LAST_PROVIDER_KEY) {
            return keychain.get(lastProvider)
        }
        
        return nil
    }

    func updateLastProvider(_ provider: String) {
        userDefaults.set(provider, forKey: LAST_PROVIDER_KEY)
    }
    
    func removeLastProvider() {
        userDefaults.removeObject(forKey: LAST_PROVIDER_KEY)
    }
    
    func clearKeyChain() {
        keychain.clear()
    }
}
