//
//  LoginPresenter.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

class LoginPresenter: BasePresenter<LoginView> {
    
    private let router: Router
    private let interactor: LoginInteractor
    
    init(router: Router, interactor: LoginInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
    func login(token: String, loginProvider: String) {
        let observable = interactor.getJWToken(token: token, loginProvider: loginProvider)
        execute(observable, onLogin, onError)
    }
    
    func login(with provider: String) -> Bool {
        let isPresent = interactor.isJWTokenPresent(for: provider)
        if isPresent {
            router.showAuthenticatedVC(animated: true)
        }
        
        return isPresent
    }
    
    func onLogin() {
        router.showSkillRateVC()
    }
    
}
