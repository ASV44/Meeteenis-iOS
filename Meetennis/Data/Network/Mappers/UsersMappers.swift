//
//  UsersMappers.swift
//  Meetennis
//
//  Created by Hackintosh on 3/26/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

extension UserMeResponseAPI {
    
    func mapping(map: Map) {
        id <- map["id"]
        email <- map["email"]
        firstName <- map["firstName"]
        lastName <- map["firstName"]
        pictureUrl <- map["firstName"]
        location <- map["location"]
    }
    
    func toUserMe() -> UserMe {
        return UserMe(id: id,
                      email: email,
                      firstName: firstName,
                      lastName: lastName,
                      pictureUrl: pictureUrl,
                      location: location.toLocation())
    }
}
