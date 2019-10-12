//
//  FacebookLoginProvider.swift
//  Meetennis
//
//  Created by Hackintosh on 3/26/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import FacebookCore
import FacebookLogin

class FacebookLoginProvider: LoginProvider {
    
    var viewController: UIViewController
    var onLoginSuccess: (String, String) -> ()
    var onLoginFailed: (Errors.Error) -> ()
    
    init(viewController: UIViewController,
         onLoginSuccess: @escaping (String, String) -> (),
         onLoginFailed: @escaping (Errors.Error) -> ()) {
        
        self.viewController = viewController
        self.onLoginSuccess = onLoginSuccess
        self.onLoginFailed = onLoginFailed
    }
    
    func login() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [.publicProfile, .email],
                           viewController: viewController,
                           completion: handleFbSignIn)
    }
    
    func getProvider() -> String {
        return LoginProviders.FACEBOOK.rawValue
    }
    
    func handleFbSignIn(loginResult: LoginResult) {
        switch loginResult {
        case .cancelled:
            print("User cancelled login.")
            break
        case .failed(let error):
            onLoginFailed(Errors.Error(code: 0, message: error.localizedDescription))
            break
        case .success( _, _, let accessToken):
            onLoginSuccess(accessToken.tokenString, LoginProviders.FACEBOOK.rawValue)
            break
        }
    }
}
