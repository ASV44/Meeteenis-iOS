//
//  UserMeGateway.swift
//  Meetennis
//
//  Created by Hackintosh on 3/26/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

protocol UsersGateway {
    func getUserMe() -> Observable<UserMe>
    func getUsers() -> Observable<[User]>
}
