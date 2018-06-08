//
//  SkillDataRepository.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

class SkillDataRepository: SkillRateGateway {
    
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getQuizData() -> Observable<[Skill]> {
        return apiService.getQuizData()
            .map { it in
                it.toSkillList()
            }
    }
    
    func submitSkillsRates(skills: [SkillRate], userId: Int) -> Observable<Void> {
        let skillRateRequest = SkillRateRequestAPI(rates: skills.map {$0.toSkillRequestAPI()})
        return apiService.postSkillsRates(request: skillRateRequest, userId: userId).map { _ in }
    }
    
    func getSkillsRates(userId: Int) -> Observable<[SkillRate]> {
        return apiService.getSkillsRates(userId: userId).map { it in
            it.toSkillsRatesList()
        }
    }
}
