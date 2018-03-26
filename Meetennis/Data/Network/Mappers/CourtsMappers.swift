//
//  CourtsMappers.swift
//  Meetennis
//
//  Created by Hackintosh on 3/26/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

extension LocationResponseAPI {
    
    func mapping(map: Map) {
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
    
    func toLocation() -> Location {
        return Location(latitude: latitude, longitude: longitude)
    }
}
