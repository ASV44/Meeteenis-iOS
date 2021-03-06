//
//  GoogleLoginProvider.swift
//  Meetennis
//
//  Created by Hackintosh on 3/26/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import GoogleSignIn

class GoogleLoginProvider: NSObject, LoginProvider, GIDSignInDelegate {
    
    var viewController: UIViewController
    var onLoginSuccess: (String, String) -> ()
    var onLoginFailed: (Errors.Error) -> ()
    
    init(viewController: UIViewController,
         onLoginSuccess: @escaping (String, String) -> (),
         onLoginFailed: @escaping (Errors.Error) -> ()) {
        
        self.viewController = viewController
        self.onLoginSuccess = onLoginSuccess
        self.onLoginFailed = onLoginFailed
        
        super.init()
        
        GIDSignIn.sharedInstance().delegate = self
    }
    
    func login() {
        GIDSignIn.sharedInstance().signIn()
    }
    
    func getProvider() -> String {
        return LoginProviders.GOOGLE.rawValue
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            let idToken = user.authentication.idToken
            onLoginSuccess(idToken!, LoginProviders.GOOGLE.rawValue)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.viewController.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.viewController.dismiss(animated: true, completion: nil)
    }
    
}
