//
//  JWTokenMapper.swift
//  Meetennis
//
//  Created by Hackintosh on 3/11/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

extension JWTokenRequestAPI{
    func mapping(map: Map) {
        data <- map["data"]
        provider <- map["provider"]
    }
}

extension ProviderDataRequestAPI{
    func mapping(map: Map) {
        token <- map["token"]
    }
}
