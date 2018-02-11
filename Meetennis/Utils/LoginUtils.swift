//
//  LoginUtils.swift
//  Meetennis
//
//  Created by Hackintosh on 2/6/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class LoginUtils {
    
    static func login(with provider: String, access token: String, _ root: UIViewController) {
        KeyChainUtils.set(access: token, for: provider)
        login(with: provider, root: root)
    }
    
    static func login(_ appDelegate: AppDelegate) {
        if let _ = KeyChainUtils.getAccesToken() {
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "QuizView")
            appDelegate.window?.rootViewController = viewController
        }
    }
    
    static func login(with provider: String, root: UIViewController) -> Bool {
        guard let token = KeyChainUtils.getAccesToken(for: provider) else {
            return false
        }
        KeyChainUtils.updateLastProvider(provider)
        root.performSegue(withIdentifier: "showQuizView", sender: root)
        
        return true
    }
    
    static func logout(vc: UIViewController) {
        KeyChainUtils.removeLastProvider()
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = mainStoryboard.instantiateViewController(withIdentifier: "LoginView")
        vc.present(loginVC, animated: true, completion: nil)
    }
}
