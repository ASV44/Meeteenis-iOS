//
//  ProviderDataRequestAPI.swift
//  Meetennis
//
//  Created by Hackintosh on 3/12/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class ProviderDataRequestAPI: Mappable {
    
    var token: String!
    
    init(token: String) {
        self.token = token
    }
    
    required init?(map: Map) {
        
    }
}
