//
//  JWTokenRequestAPI.swift
//  Meetennis
//
//  Created by Hackintosh on 3/12/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class JWTokenRequestAPI: Mappable {
    
    var data: ProviderDataRequestAPI!
    var provider: String!
    
    init(data: ProviderDataRequestAPI, provider: String) {
        self.data = data
        self.provider = provider
    }
    
    required init?(map: Map) {
        
    }
}
