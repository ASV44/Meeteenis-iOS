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
        execute(interactor.getJWToken(), onLogin, onError)
    }
    
    func onLogin() {
        router.showAuthenticatedVC(animated: false)
        //router.showSkillRateVC()
    }
    
    override func onError(error: Error) {
        router.showLoginVC()
    }
}
