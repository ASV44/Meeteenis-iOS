//
//  User.swift
//  Meetennis
//
//  Created by Hackintosh on 4/15/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class User: Mappable {
    
    var id: Int!
    var email: String!
    var firstName : String!
    var lastName: String!
    var pictureUrl: String!
    
    init(id: Int, email: String, firstName: String, lastName: String, pictureUrl: String) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.pictureUrl = pictureUrl
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
    
    }
    
    
}
