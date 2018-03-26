//
//  SkillMapper.swift
//  Meetennis
//
//  Created by Hackintosh on 3/26/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

extension SkillItem {
    
    func mapping(map: Map) {
        
    }
    
    func toSkillRate() -> SkillRate {
        return SkillRate(skill: id, rating: rating * 20)
    }
    
}

extension Skill {
    
    func toSkillItem() -> SkillItem {
        return SkillItem(id: id, name: name, description: description, iconUrl: iconUrl)
    }
}
