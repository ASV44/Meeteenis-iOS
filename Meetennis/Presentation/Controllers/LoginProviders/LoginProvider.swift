//
//  LoginProvider.swift
//  Meetennis
//
//  Created by Hackintosh on 3/26/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//


protocol LoginProvider {
    func login()
    func getProvider() -> String
}
