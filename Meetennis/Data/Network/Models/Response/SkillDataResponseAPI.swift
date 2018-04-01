//
//  SkillDataResponseAPI.swift
//  Meetennis
//
//  Created by Hackintosh on 3/25/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class SkillDataResponseAPI: Mappable {
    
    var data: [SkillResponseAPI]!
    var totalElements: Int!
    
    init(data: [SkillResponseAPI], totalElements: Int) {
        self.data = data
        self.totalElements = totalElements
    }
    
    required init?(map: Map) {
        
    }
}
