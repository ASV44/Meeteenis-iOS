//
//  Court.swift
//  Meetennis
//
//  Created by Hackintosh on 6/8/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

class Court {
    
    var id: Int!
    var name: String!
    var address: Address!
    var pictures: [Picture]!
    var opensAt: String!
    var closesAt: String!
    
    init(id: Int,
         name: String,
         address: Address,
         pictures: [Picture],
         opensAt: String,
         closesAt: String) {
        
        self.id = id
        self.name = name
        self.address = address
        self.pictures = pictures
        self.opensAt = opensAt
        self.closesAt = closesAt
    }
}
