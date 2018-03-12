//
//  LoginPresenter.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class LoginPresenter {
    
    private let router: Router
    private let interactor: LoginInteractor
    
    init(router: Router, interactor: LoginInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
    func login(token: String, loginProvider: String) {
        interactor.getJWToken(token: token, loginProvider: loginProvider)
    }
    
}
