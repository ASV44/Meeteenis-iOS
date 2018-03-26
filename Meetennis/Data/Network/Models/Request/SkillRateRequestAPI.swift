//
//  SkillRateRequestAPI.swift
//  Meetennis
//
//  Created by Hackintosh on 3/26/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class SkillRateRequestAPI: Mappable {
    
    var rates: [SkillRequestAPI]!
    
    init(rates: [SkillRequestAPI]) {
        self.rates = rates
    }
    
    required init?(map: Map) {
        
    }
    
}
