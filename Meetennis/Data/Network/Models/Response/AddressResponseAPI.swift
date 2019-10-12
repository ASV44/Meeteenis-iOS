//
//  AddressResponseAPI.swift
//  Meetennis
//
//  Created by Hackintosh on 6/8/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class AddressResponseAPI: Mappable {
    
    var addressLine1: String!
    var addressLine2: String!
    var city: String!
    var stateCode: String!
    var zipCode: String!
    var phoneNumber: String!
    var countryCode: String!
    var location: LocationResponseAPI!
    
    required init?(map: Map) {
        
    }
}
