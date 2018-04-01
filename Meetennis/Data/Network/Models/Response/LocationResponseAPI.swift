//
//  LocationResponseAPI.swift
//  Meetennis
//
//  Created by Hackintosh on 3/26/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class LocationResponseAPI: Mappable {
    
    var latitude: Double!
    var longitude: Double!
    
    required init?(map: Map) {
        
    }
}
