//
//  CourtsResponseAPI.swift
//  Meetennis
//
//  Created by Hackintosh on 6/8/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class CourtsResponseAPI: Mappable {
    
    var data: [CourtResponseAPI]!
    var totalElements: Int!
    
    required init?(map: Map) {
        
    }
}
