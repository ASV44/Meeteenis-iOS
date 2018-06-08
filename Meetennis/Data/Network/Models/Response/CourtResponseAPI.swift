//
//  CourtResponseAPI.swift
//  Meetennis
//
//  Created by Hackintosh on 6/8/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class CourtResponseAPI: Mappable {
    
    var id: Int!
    var name: String!
    var address: AddressResponseAPI!
    var pictures: [PictureResponseAPI]!
    var opensAt: String!
    var closesAt: String!
    
    required init?(map: Map) {
        
    }
}
