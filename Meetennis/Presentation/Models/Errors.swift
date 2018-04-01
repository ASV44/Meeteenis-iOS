//
//  Error.swift
//  Meetennis
//
//  Created by Hackintosh on 3/25/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//


class Errors {
    
    struct Error {
        let code: Int
        let message: String
        var description: String {
            get {
                return String(code) + "\n" + message
            }
        }
    }
    
    static let GENERAL_ERROR = Error(code: 0, message: "Unknown error")
    static let NETWORK_CONNECTION_ERROR = Error(code: 1, message: "Internet connection error")
}
