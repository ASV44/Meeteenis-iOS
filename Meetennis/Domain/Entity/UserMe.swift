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
    var gender: Int!
    var following: Bool!
    
    init(id: Int,
         email: String,
         firstName: String,
         lastName: String,
         pictureUrl: String,
         location: Location,
         gender: Int,
         following: Bool) {
        
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.pictureUrl = pictureUrl
        self.location = location
        self.gender = gender
        self.following = following
    }
}
