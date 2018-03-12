//
//  APICommunication.swift
//  Meetennis
//
//  Created by Hackintosh on 3/11/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import Alamofire

class APICommunication: APIService {
    
    func getJWToken(requestParameters: Parameters) {
        print("***************",requestParameters)
        Alamofire.request(Url.authentication, method: .post, parameters: requestParameters, encoding: JSONEncoding.default).responseJSON { response in
            print(response.response?.statusCode)
            switch response.result {
            case .success(let value):
//                let response = JSON(value)
//                let token = response["token"].string!
//                LoginUtils.login(with: provider, access: token, self)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    
}
