//
//  SplashViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 3/24/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController, SplashView {
    
    var presenter: SplashPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenter()
        
        presenter.logIn()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setPresenter() {
        presenter = SplashPresenter(router: Router(viewController: self), interactor: LoginInteractor(gateWay: JWTokenRepository(apiService: APICommunication())))
        presenter.view = self
    }
}
