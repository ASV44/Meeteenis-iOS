//
//  UserMeResponseAPI.swift
//  Meetennis
//
//  Created by Hackintosh on 3/26/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class UserMeResponseAPI: Mappable {
   
    var wallets: [Int]!
    var id: Int!
    var email: String!
    var firstName: String!
    var lastName: String!
    var pictureUrl: String!
    var location: LocationResponseAPI!
    var role: Int!
    
    required init?(map: Map) {
        
    }
}
