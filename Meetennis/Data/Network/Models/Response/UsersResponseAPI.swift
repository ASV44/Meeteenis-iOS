//
//  UsersResponseAPI.swift
//  Meetennis
//
//  Created by Hackintosh on 5/13/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class UsersResponseAPI: Mappable {
    
    var data: [UserResponseAPI]!
    var totalElements: Int!
    
    required init?(map: Map) {
        
    }
}
