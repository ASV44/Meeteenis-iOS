//
//  URL.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

struct Url {
    
    private struct Domains {
        static let Dev = "https://meetennis-api-test.azurewebsites.net"
        static let QA = ""
    }
    
    private  struct Routes {
        static let Api = "/api"
    }
    
    private  static let Domain = Domains.Dev
    private  static let Route = Routes.Api
    private  static let BaseURL = Domain + Route
    
    static var authentication: String {
        return BaseURL  + "/authentication"
    }
    
    static var skills: String {
        return BaseURL  + "/skill"
    }
    
    static var skillsRates: String {
        return BaseURL + "/skillrate/"
    }
    
    static var userMe: String {
        return BaseURL + "/user/me"
    }
    
    static var users: String {
        return BaseURL + "/user"
    }
}
