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
    private let data: Data
    let message: String
    
    init(code: Int!, data: Data!) {
        self.code = code ?? 0
        self.data = data ?? Data()
        if let errorMessage = JSON(data)["message"].string {
            self.message = errorMessage
        } else {
            self.message = "Error"
        }
    }
}
