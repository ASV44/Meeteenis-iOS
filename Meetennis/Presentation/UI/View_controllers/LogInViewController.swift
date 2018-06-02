//
//  ViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 2/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LogInViewController: BaseViewController<LoginView, LoginPresenter>, LoginView {
    
    var facebookLoginProvider: FacebookLoginProvider!
    var googleLoginProvider: GoogleLoginProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenter()
        
        facebookLoginProvider = FacebookLoginProvider(viewController: self,
                                                      onLoginSuccess: presenter.login,
                                                      onLoginFailed: onError)
        
        googleLoginProvider = GoogleLoginProvider(viewController: self,
                                                  onLoginSuccess: presenter.login,
                                                  onLoginFailed: onError)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setPresenter() {
        presenter = LoginPresenter(router: Router(viewController: self), interactor: LoginInteractor(gateWay: JWTokenRepository(apiService: APICommunication())))
        presenter.view = self
    }
    
    @IBAction func googleSignInClick(_ sender: Any) {
        if !presenter.login(with: googleLoginProvider.getProvider()) {
            loginWith(provider: googleLoginProvider)
        }
    }
    
    @IBAction func fbSignInClick(_ sender: Any) {
        if !presenter.login(with: facebookLoginProvider.getProvider()) {
            loginWith(provider: facebookLoginProvider)
        }
    }
    
    func loginWith(provider: LoginProvider) {
        provider.login()
    }
}

