//
//  UserMeRepository.swift
//  Meetennis
//
//  Created by Hackintosh on 3/26/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

class UserMeRepository: UserMeGateway {
    
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    
    func getUser() -> Observable<UserMe> {
        return apiService.getUserMe()
            .map { it in
                it.toUserMe()
            }
    }
}
