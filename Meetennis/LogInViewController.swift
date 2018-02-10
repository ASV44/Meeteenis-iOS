//
//  ViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 2/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import GoogleSignIn
import Alamofire

class LogInViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    private let URL = "https://meetennis-api-test.azurewebsites.net/api/authentication"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            let idToken = user.authentication.idToken
            sendLoginRequest(accessToken: idToken!, provider: "google")
        }
    }

    
    @IBAction func fbSignInClick(_ sender: Any) {
        if(!LoginUtils.login(with: "facebook", root: self)) {
            let loginManager = LoginManager()
            loginManager.logIn(readPermissions: [.publicProfile, .email],
                               viewController: self,
                               completion: handleFbSignIn)
        }
    }
    
    func handleFbSignIn(loginResult: LoginResult) {
        switch loginResult {
            case .cancelled:
                print("User cancelled login.")
                break
            case .failed(let error):
                print(error)
                break
            case .success( _, _, let accessToken):
                self.sendLoginRequest(accessToken: accessToken.authenticationToken, provider: "facebook")
                break
        }
    }
    
    @IBAction func googleSignInClick(_ sender: Any) {
        if(!LoginUtils.login(with: "google", root: self)) {
            GIDSignIn.sharedInstance().signIn()
        }
    }
    
    func sendLoginRequest(accessToken: String, provider: String) {
        let parameters: Parameters = [
            "data": [
                "token" : accessToken
            ],
            "provider": provider
        ]
        
        Alamofire.request(URL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            if let token = response.result.value as? [String : String]  {
                LoginUtils.login(with: provider, access: token["token"]!, self)
            }
        }
    }
}

