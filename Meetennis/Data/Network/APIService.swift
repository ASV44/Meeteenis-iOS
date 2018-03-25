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
    func getJWToken(requestParameters: Parameters) -> Observable<JWTokenResponseAPI>
    func getQuizData() -> Observable<SkillDataResponseAPI>
}
