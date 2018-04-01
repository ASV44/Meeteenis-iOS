//
//  HttpException.swift
//  Meetennis
//
//  Created by Hackintosh on 3/25/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import Foundation
import SwiftyJSON

class HttpException: Error {
    let code: Int
    let message: String
    
    init(data: Data!) {
        let jsonData = JSON(data)
        self.code = jsonData["code"].intValue
        self.message = JSON(data)["message"].stringValue
    }
    
    init(code: Int!, error: Error) {
        self.code = code ?? 0
        self.message = error.localizedDescription
    }
}
