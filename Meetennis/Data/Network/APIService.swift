//
//  APIservice.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import Alamofire
import RxSwift
import ObjectMapper

protocol APIService {
    func getJWToken(request: JWTokenRequestAPI) -> Observable<JWTokenResponseAPI>
    func getQuizData() -> Observable<SkillDataResponseAPI>
    func getUserMe() -> Observable<UserMeResponseAPI>
    func postSkillsRates(request: SkillRateRequestAPI, userId: Int) -> Observable<SkillRateRequestAPI>
    func getUsers() -> Observable<UsersResponseAPI>
    func getSkillsRates(userId: Int) -> Observable<SkillsRatesResponseAPI>
    func getCourts() -> Observable<CourtsResponseAPI>
}
