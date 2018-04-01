//
//  Interactor.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

class LoginInteractor {
    
    private let gateWay: LoginGateway
    
    init(gateWay: LoginGateway) {
        self.gateWay = gateWay
    }
    
    func getJWToken(token: String, loginProvider: String) ->  Observable<Void> {
        return gateWay.getJWToken(accessToken: token, provider: loginProvider)
    }
    
    func getJWToken() -> Observable<Void> {
        return gateWay.getJWToken()
    }
    
    func isJWTokenPresent(for provider: String) -> Bool {
        return gateWay.isJWTokenPresent(for: provider)
    }
}
