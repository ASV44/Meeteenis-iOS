//
//  LoginUtils.swift
//  Meetennis
//
//  Created by Hackintosh on 2/6/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class LoginUtils {
    
    private static let tokenCacheFileName = "JWTokens.json"
    
    static func getTokenDataForCahce(_ token: String, provider: String) -> [String: String] {
        var tokens = getCachedTokens()
        if tokens != nil {
            tokens!["lastProvider"] = provider
            tokens![provider] = token
        } else {
            tokens = ["lastProvider": provider, provider: token]
        }
        
        return tokens!
    }
    
    private static func serializeTokens(_ tokenData: [String: String]) {
        let fileUrl = FileUtils.getFileUrl(tokenCacheFileName,
                                           in: .documentDirectory,
                                           with: .userDomainMask)
        
        do {
            let data = try JSONSerialization.data(withJSONObject: tokenData, options: .prettyPrinted)
            try data.write(to: fileUrl, options: [])
        }
        catch {
            print(error)
        }
    }
    
    static func unCacheToken(provider: String) -> String! {
        let tokens = getCachedTokens()
        
        return tokens?[provider]
    }
    
    private static func getCachedTokens() -> [String: String]! {
        let fileUrl = FileUtils.getFileUrl(tokenCacheFileName,
                                           in: .documentDirectory,
                                           with: .userDomainMask)
        
        print("Token save path: ",fileUrl)
        
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            do {
                let data = try Data(contentsOf: fileUrl, options: .alwaysMapped)
                let tokenData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : String]
                return tokenData
            } catch {
                print(error)
            }
        }
        return nil
    }
    
    static func login(with provider: String, cache tokenData: [String: String], _ root: UIViewController) {
        serializeTokens(tokenData)
        let token = tokenData[provider]
        UserDefaults.standard.set(token, forKey: "JWToken")
        root.performSegue(withIdentifier: "showQuizView", sender: root)
    }
    
    static func login(_ appDelegate: AppDelegate) {
        if let tokens = getCachedTokens(),
           let lastProvider = tokens["lastProvider"] {
            
            let token = tokens[lastProvider]
            UserDefaults.standard.set(token, forKey: "JWToken")
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "QuizView")
            appDelegate.window?.rootViewController = viewController
        }
    }
    
    static func login(with provider: String, root: UIViewController) -> Bool {
        guard var tokens = LoginUtils.getCachedTokens(),
              let _ = tokens[provider] else {
            return false
        }
        tokens["lastProvider"] = provider
        login(with: provider, cache: tokens, root)
        
        return true
    }
    
    static func logout(vc: UIViewController) {
        if var tokens = getCachedTokens() {
            tokens.removeValue(forKey: "lastProvider")
            serializeTokens(tokens)
        }
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = mainStoryboard.instantiateViewController(withIdentifier: "LoginView")
        vc.present(loginVC, animated: true, completion: nil)
    }
}
