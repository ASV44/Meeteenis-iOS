//
//  Skill.swift
//  Meetennis
//
//  Created by Hackintosh on 3/25/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//


class Skill {
    
    var id: Int!
    var name: String!
    var description: String!
    var iconUrl: String!
    
    init(id: Int, name: String, description: String, iconUrl: String) {
        self.id = id
        self.name = name
        self.description = description
        self.iconUrl = iconUrl
    }
}
