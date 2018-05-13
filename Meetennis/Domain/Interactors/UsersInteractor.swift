//
//  UsersInteractor.swift
//  Meetennis
//
//  Created by Hackintosh on 5/13/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

class UsersInteractor {
    
    private let userMeGateway: UsersGateway
    
    init(userMeGateway: UsersGateway) {
        self.userMeGateway = userMeGateway
    }
    
    func getUsers() -> Observable<[User]> {
        return userMeGateway.getUsers()
    }
}
