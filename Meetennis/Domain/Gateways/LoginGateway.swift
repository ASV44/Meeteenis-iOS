//
//  LoginGateway.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

protocol LoginGateway {
    func getJWToken(accessToken: String, provider: String)
}
