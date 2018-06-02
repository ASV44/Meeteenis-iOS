//
//  SkillRateGateway.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

protocol SkillRateGateway {
    func getQuizData() -> Observable<[Skill]>
    func submitSkillsRates(skills: [SkillRate], userId: Int) -> Observable<Void>
    func getSkillsRates(userId: Int) -> Observable<[SkillRate]>
}
