//
//  SkillRequestApi.swift
//  Meetennis
//
//  Created by Hackintosh on 3/26/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class SkillRequestAPI: Mappable {
    
    var skill: Int!
    var value: Int!
    
    init(skill: Int, rating: Int) {
        self.skill = skill
        self.value = rating
    }
    
    required init?(map: Map) {
        
    }
    
}
