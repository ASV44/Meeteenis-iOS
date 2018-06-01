//
//  UserMeRepository.swift
//  Meetennis
//
//  Created by Hackintosh on 3/26/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

class UsersDataRepository: UsersGateway {
    
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    
    func getUserMe() -> Observable<UserMe> {
        return apiService.getUserMe()
            .map { it in
                it.toUserMe()
            }
    }
    
    func getUsers() -> Observable<[User]> {
        return apiService.getUsers()
            .map { it in
                it.toUsersList()
        }
    }
}
