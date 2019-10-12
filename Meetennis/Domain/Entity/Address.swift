//
//  Address.swift
//  Meetennis
//
//  Created by Hackintosh on 6/8/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

class Address {
    
    var addressLine1: String!
    var addressLine2: String!
    var city: String!
    var stateCode: String!
    var zipCode: String!
    var phoneNumber: String!
    var countryCode: String!
    var location: Location!
    
    init(address1: String,
         address2: String,
         city: String,
         stateCode: String,
         zipCode: String,
         phoneNumber: String,
         coutryCode: String,
         location: Location) {
        
        self.addressLine1 = address1
        self.addressLine2 = address2
        self.city = city
        self.stateCode = stateCode
        self.zipCode = zipCode
        self.phoneNumber = phoneNumber
        self.countryCode = coutryCode
        self.location = location
    }
}
