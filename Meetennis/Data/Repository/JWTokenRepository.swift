//
//  JWTokenRepository.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

class JWTokenRepository: LoginGateway {
    
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getJWToken(accessToken: String, provider: String) {
        let jwtokenRequestApi = JWTokenRequestAPI(data: ProviderDataRequestAPI(token: accessToken), provider: provider)
        apiService.getJWToken(requestParameters: jwtokenRequestApi.toJSON())
    }
    
    
}
