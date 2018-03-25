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
    
    func onError(error: Error) {
        switch error {
        case is HttpException:
            let exception = error as! HttpException
            view.onError(error: Errors.Error(code: exception.code, message: exception.message))
            break
        case is NetworkConnectionException:
            view.onError(error: Errors.NETWORK_CONNECTION_ERROR)
            break
        default:
            view.onError(error: Errors.GENERAL_ERROR)
        }
    }
}
