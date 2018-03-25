//
//  SkillRateInteractor.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

class SkillRateInteractor {
    
    private let gateWay: SkillRateGateway
    
    init(gateWay: SkillRateGateway) {
        self.gateWay = gateWay
    }
    
    func getQuizData() -> Observable<[Skill]>{
        return gateWay.getQuizData()
    }
}
