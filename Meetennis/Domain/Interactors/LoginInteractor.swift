//
//  Interactor.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//


class LoginInteractor {
    
    private let gateWay: LoginGateway
    
    init(gateWay: LoginGateway) {
        self.gateWay = gateWay
    }
    
    func getJWToken(token: String, loginProvider: String) {
        gateWay.getJWToken(accessToken: token, provider: loginProvider)
    }
}
