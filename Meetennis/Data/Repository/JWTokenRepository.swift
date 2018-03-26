//
//  JWTokenRepository.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

class JWTokenRepository: LoginGateway {
    
    private let apiService: APIService
    private let keyChain: KeyChain
    
    init(apiService: APIService) {
        self.apiService = apiService
        self.keyChain = KeyChain()
    }
    
    func getJWToken(accessToken: String, provider: String) -> Observable<Void>  {
        let jwtokenRequestApi = JWTokenRequestAPI(data: ProviderDataRequestAPI(token: accessToken), provider: provider)
        return apiService.getJWToken(request: jwtokenRequestApi)
            .map { it in
                it.toJWToken()
            }
            .map { it in
                self.keyChain.set(access: it.token, for: provider)
            }
    }
    
    func getJWToken() -> Observable<Void> {
        return Observable.create { observer in
            if let _ = self.keyChain.getAccesToken() {
                observer.onNext(Void())
            }
            else {
                observer.onError(RxError.noElements)
            }
            
            return Disposables.create()
        }
    }
    
    func isJWTokenPresent(for provider: String) -> Bool {
        guard let _ = keyChain.getAccesToken(for: provider) else {
            return false
        }
        keyChain.updateLastProvider(provider)
        return true
    }
    
}
