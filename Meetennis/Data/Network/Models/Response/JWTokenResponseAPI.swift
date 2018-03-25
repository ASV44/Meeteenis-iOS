//
//  JWTokenResponseAPI.swift
//  Meetennis
//
//  Created by Hackintosh on 3/13/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class JWTokenResponseAPI: Mappable {
    
    var token: String!
    
    init(token: String) {
        self.token = token
    }
    
    required init?(map: Map) {
        
    }
}
