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

class LogInViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    @IBOutlet weak var fbSignIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
//        googleSignIn.style = .iconOnly
//        googleSignIn.colorScheme = .dark
//        googleSignIn.backgroundColor = UIColor(patternImage: UIImage(named: "googleSignin.png")!)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            print(userId, idToken, fullName, givenName, familyName, email)
        }
    }

    
    @IBAction func fbSignInClick(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile], viewController: self, completion: {loginResult in
            switch loginResult {
            case .cancelled:
                print("User cancelled login.")
                break
            case .failed(let error):
                break
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!", accessToken)
                break    
            }
        })
    }
    
    @IBAction func googleSignInClick(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
}

