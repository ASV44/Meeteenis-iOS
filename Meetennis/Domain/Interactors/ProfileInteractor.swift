//
//  ProfileInteractor.swift
//  Meetennis
//
//  Created by Hackintosh on 5/13/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

class ProfileInteractor {
    
    private let userMeGateway: UsersGateway
    
    init(userMeGateway: UsersGateway) {
        self.userMeGateway = userMeGateway
    }
    
    func getUserMeData() -> Observable<UserMe> {
        return userMeGateway.getUserMe()
    }
    
    func getUsers() -> Observable<[User]> {
        return userMeGateway.getUsers()
    }
}
