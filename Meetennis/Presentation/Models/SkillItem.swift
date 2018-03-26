//
//  SkillItem.swift
//  Meetennis
//
//  Created by Hackintosh on 3/26/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

class SkillItem: Mappable {

    var id: Int!
    var name: String!
    var description: String!
    var imageUrl: String!
    var rating: Int!
    
    init(id: Int, name: String, description: String, iconUrl: String) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = iconUrl
        self.rating = 0
    }
    
    required init?(map: Map) {
        
    }
}
