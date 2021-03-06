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
    
    func getJWToken(request: JWTokenRequestAPI) -> Observable<JWTokenResponseAPI> {
        return requestExecutor.execute(to: Url.authentication, with: request.toJSON(), method: .post)
    }
    
    func getQuizData() -> Observable<SkillDataResponseAPI> {
        return requestExecutor.execute(to: Url.skills, with: nil, method: HTTPMethod.get, headers: getRequestHeader())
    }
    
    func getUserMe() -> Observable<UserMeResponseAPI> {
        return requestExecutor.execute(to: Url.userMe, with: nil, method: HTTPMethod.get, headers: getRequestHeader())
    }
    
    func postSkillsRates(request: SkillRateRequestAPI, userId: Int) -> Observable<SkillRateRequestAPI> {
        return requestExecutor.execute(to: Url.skillsRates + String(userId), with: request.toJSON(), method: .post, headers: getRequestHeader())
    }
    
    func getUsers() -> Observable<UsersResponseAPI> {
        return requestExecutor.execute(to: Url.users, with: nil, method: .get, headers: getRequestHeader())
    }
    
    func getSkillsRates(userId: Int) -> Observable<SkillsRatesResponseAPI> {
        return requestExecutor.execute(to: Url.skillsRates + String(userId), with: nil, method: .get, headers: getRequestHeader())
    }
    
    func getCourts() -> Observable<CourtsResponseAPI> {
        return requestExecutor.execute(to: Url.court, with: nil, method: .get, headers: getRequestHeader())
    }
    
    func getRequestHeader() -> HTTPHeaders {
        return ["Authorization": "Bearer " + keyChain.getAccesToken()]
    }
    
}
