//
//  SplashPresenter.swift
//  Meetennis
//
//  Created by Hackintosh on 3/24/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

class SplashPresenter: BasePresenter<SplashView> {
    
    private let router: Router
    private let interactor: LoginInteractor
    
    init(router: Router, interactor: LoginInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
    func logIn() {
        let observable = interactor.getJWToken()
        execute(observable, onLogin, onError)
    }
    
    func onLogin() {
        router.showAuthenticatedVC(animated: false)
    }
    
    func onError(error: Error) {
        router.showLoginVC()
    }
}
