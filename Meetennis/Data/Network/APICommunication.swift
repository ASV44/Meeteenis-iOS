//
//  APICommunication.swift
//  Meetennis
//
//  Created by Hackintosh on 3/11/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import Alamofire
import RxSwift

class APICommunication: APIService {
    
    private let requestExecutor: RequestExecutor
    private let keyChain: KeyChain
    
    init() {
        requestExecutor = RequestExecutor()
        keyChain = KeyChain()
    }
    
    func getJWToken(requestParameters: Parameters) -> Observable<JWTokenResponseAPI> {
        return requestExecutor.execute(to: Url.authentication, with: requestParameters, method: .post)
    }
    
    func getQuizData() -> Observable<SkillDataResponseAPI> {
        return requestExecutor.execute(to: Url.skills, with: nil, method: HTTPMethod.get, headers: getRequestHeader())
    }
    
    func getRequestHeader() -> HTTPHeaders {
        return ["Authorization": "Bearer " + keyChain.getAccesToken()]
    }
    
}
