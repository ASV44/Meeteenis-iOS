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
    private let skillGateway: SkillRateGateway
    
    init(userMeGateway: UsersGateway, skillGateway: SkillRateGateway) {
        self.userMeGateway = userMeGateway
        self.skillGateway = skillGateway
    }
    
    func getUserMeData() -> Observable<UserMe> {
        return userMeGateway.getUserMe()
    }
    
    func getUsers() -> Observable<[User]> {
        return userMeGateway.getUsers()
    }
    
    func getSkillsRates() -> Observable<[SkillRate]> {
        return userMeGateway.getUserMe()
            .flatMap {
                self.skillGateway.getSkillsRates(userId: $0.id)
        }
    }
    
}
