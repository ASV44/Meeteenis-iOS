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
        lastName <- map["lastName"]
        pictureUrl <- map["pictureUrl"]
        location <- map["location"]
        gender <- map["gender"]
        following <- map["following"]
    }
    
    func toUserMe() -> UserMe {
        return UserMe(id: id,
                      email: email,
                      firstName: firstName,
                      lastName: lastName,
                      pictureUrl: pictureUrl,
                      location: location.toLocation(),
                      gender: gender,
                      following: following)
    }
}

extension UserResponseAPI {
    
    func mapping(map: Map) {
        id <- map["id"]
        email <- map["email"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        pictureUrl <- map["pictureUrl"]
    }
    
    func toUser() -> User {
        return User(id: id,
                    email: email,
                    firstName: firstName,
                    lastName: lastName,
                    pictureUrl: pictureUrl)
    }
}

extension UsersResponseAPI {
    
    func mapping(map: Map) {
        data <- map["data"]
        totalElements <- map["totalElements"]
    }
    
    func toUsersList() -> [User] {
        var users = [User]()
        
        for user in data {
            users.append(user.toUser())
        }
        
        return users
    }
}
