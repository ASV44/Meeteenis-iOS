//
//  SkillDataMapper.swift
//  Meetennis
//
//  Created by Hackintosh on 3/25/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

extension SkillDataResponseAPI {
    
    func mapping(map: Map) {
        data <- map["data"]
        totalElements <- map["totalElements"]
    }
    
    func toSkillList() -> [Skill] {
        var skills = [Skill]()
        
        for skill in data {
            skills.append(skill.toSkill())
        }
        
        return skills
    }
    
}

extension SkillResponseAPI {
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        iconUrl <- map["iconUrl"]
    }
    
    func toSkill() -> Skill {
        return Skill(id: id, name: name,
                     description: description,
                     iconUrl: iconUrl)
    }
    
}

extension SkillRateRequestAPI {
    
    func mapping(map: Map) {
        rates <- map["rates"]
    }
}

extension SkillRequestAPI {
    
    func mapping(map: Map) {
        skill <- map["skill"]
        value <- map["value"]
    }
}

extension SkillRate {
    
    func toSkillRequestAPI() ->  SkillRequestAPI{
        return SkillRequestAPI(skill: skill, rating: rating)
    }
}

extension SkillsRatesResponseAPI {
    
    func mapping(map: Map) {
        rates <- map["rates"]
    }
    
    func toSkillsRatesList() -> [SkillRate] {
        var skillsRates = [SkillRate]()
        
        for rate in rates {
            skillsRates.append(rate.toSkillRate())
        }
        
        return skillsRates
    }

}

extension SkillRateResponseAPI {
    
    func mapping(map: Map) {
        skill <- map["skill"]
        value <- map["value"]
    }
    
    func toSkillRate() -> SkillRate {
        return SkillRate(skill: skill, rating: value)
    }
}
