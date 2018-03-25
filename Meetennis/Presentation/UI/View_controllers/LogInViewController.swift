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
import SwiftyJSON

class LogInViewController: UIViewController,LoginView, GIDSignInUIDelegate, GIDSignInDelegate {
    
    var presenter: LoginPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenter()
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setPresenter() {
        presenter = LoginPresenter(router: Router(viewController: self), interactor: LoginInteractor(gateWay: JWTokenRepository(apiService: APICommunication())))
        presenter.view = self
    }
    
    @IBAction func googleSignInClick(_ sender: Any) {
        if !presenter.login(with: "google") {
            GIDSignIn.sharedInstance().signIn()
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            let idToken = user.authentication.idToken
            presenter.login(token: idToken!, loginProvider: "google")
        }
    }

    
    @IBAction func fbSignInClick(_ sender: Any) {
        if !presenter.login(with: "facebook") {
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
                presenter.login(token: accessToken.authenticationToken, loginProvider: "facebook")
                break
        }
    }
    
    func onError(error: Errors.Error) {
        let alert = UIAlertController(title: nil, message: error.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            alert!.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

