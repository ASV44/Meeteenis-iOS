//
//  SkillRateResponseAPI.swift
//  Meetennis
//
//  Created by Hackintosh on 6/2/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class SkillRateResponseAPI: Mappable {
    
    var skill: Int!
    var value: Int!
    
    init(skill: Int, value: Int) {
        self.skill = skill
        self.value = value
    }
    
    required init?(map: Map) {
        
    }
    
}
