//
//  SkillsRatesResponse.swift
//  Meetennis
//
//  Created by Hackintosh on 6/2/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class SkillsRatesResponseAPI: Mappable {
    
    var rates: [SkillRateResponseAPI]!
    
    init(rates: [SkillRateResponseAPI]) {
        self.rates = rates
    }
    
    required init?(map: Map) {
        
    }
}
