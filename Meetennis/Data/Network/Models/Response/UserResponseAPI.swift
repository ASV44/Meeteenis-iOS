//
//  UserResponseAPI.swift
//  Meetennis
//
//  Created by Hackintosh on 5/13/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class UserResponseAPI: Mappable {
    
    var id: Int!
    var email: String!
    var firstName: String!
    var lastName: String!
    var pictureUrl: String!
    
    required init?(map: Map) {
        
    }
}
