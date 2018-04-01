//
//  LoginGateway.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

protocol LoginGateway {
    func getJWToken(accessToken: String, provider: String) -> Observable<Void>
    func getJWToken() -> Observable<Void>
    func isJWTokenPresent(for provider: String) -> Bool
}
