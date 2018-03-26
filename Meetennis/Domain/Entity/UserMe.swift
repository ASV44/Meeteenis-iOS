//
//  UserMe.swift
//  Meetennis
//
//  Created by Hackintosh on 3/26/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//


class UserMe {
    
    var id: Int!
    var email: String!
    var firstName: String!
    var lastName: String!
    var pictureUrl: String!
    var location: Location!
    
    init(id: Int,
         email: String,
         firstName: String,
         lastName: String,
         pictureUrl: String,
         location: Location) {
        
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.pictureUrl = pictureUrl
        self.location = location
    }
}
