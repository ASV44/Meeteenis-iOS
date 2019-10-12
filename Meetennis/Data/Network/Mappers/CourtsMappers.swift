//
//  CourtsMappers.swift
//  Meetennis
//
//  Created by Hackintosh on 3/26/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import ObjectMapper

extension CourtsResponseAPI {
    
    func mapping(map: Map) {
        data <- map["data"]
        totalElements <- map["totalElements"]
    }
    
    func toCourtList() -> [Court] {
        var courtList = [Court]()
        
        for court in data {
            courtList.append(court.toCourt())
        }
        
        return courtList
    }
}

extension CourtResponseAPI {
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        address <- map["address"]
        pictures <- map["pictures"]
        opensAt <- map["opensAt"]
        closesAt <- map["closesAt"]
    }
    
    func toCourt() -> Court {
        return Court(id: id,
                     name: name,
                     address: address.toAddress(),
                     pictures: toPictures(),
                     opensAt: opensAt,
                     closesAt: closesAt)
    }
    
    func toPictures() -> [Picture] {
        var pictures = [Picture]()
        
        for picture in self.pictures {
            pictures.append(picture.toPicture())
        }
        
        return pictures
    }
}

extension AddressResponseAPI {
    
    func mapping(map: Map) {
        addressLine1 <- map ["addressLine1"]
        addressLine2 <- map["addressLine2"]
        city <- map["city"]
        stateCode <- map["stateCode"]
        zipCode <- map["zipCode"]
        phoneNumber <- map["phoneNumber"]
        countryCode <- map["countryCode"]
        location <- map["location"]
    }
    
    func toAddress() -> Address {
        return Address(address1: addressLine1,
                       address2: addressLine2 ?? "",
                       city: city,
                       stateCode: stateCode ?? "",
                       zipCode: zipCode,
                       phoneNumber: phoneNumber ?? "",
                       coutryCode: countryCode,
                       location: location.toLocation())
    }
}

extension PictureResponseAPI {
    
    func mapping(map: Map) {
        url <- map["url"]
    }
    
    func toPicture() -> Picture {
        return Picture(url: url)
    }
}
