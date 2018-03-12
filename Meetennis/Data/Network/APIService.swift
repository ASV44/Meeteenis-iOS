//
//  APIservice.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

protocol APIService {
    func getJWToken(requestParameters: [String: Any])
}
