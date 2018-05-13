//
//  SkillRateInteractor.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

class SkillRateInteractor {
    
    private let skillGateWay: SkillRateGateway
    private let userMeGateway: UsersGateway
    
    init(skillGateWay: SkillRateGateway, userMeGateway: UsersGateway) {
        self.skillGateWay = skillGateWay
        self.userMeGateway = userMeGateway
    }
    
    func getQuizData() -> Observable<[Skill]>{
        return skillGateWay.getQuizData()
    }
    
    func submitSkillsRates(skillRates: [SkillRate]) -> Observable<Void> {
        return userMeGateway.getUserMe()
            .flatMap {
                self.skillGateWay.submitSkillsRates(skills: skillRates, userId: $0.id)
            }
    }
}
