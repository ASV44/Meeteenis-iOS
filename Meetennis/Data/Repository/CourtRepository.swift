//
//  CourtRepository.swift
//  Meetennis
//
//  Created by Hackintosh on 6/8/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

class CourtRepository: CourtGateway {
    
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func getCourts() -> Observable<[Court]> {
        return apiService.getCourts()
            .map { it in
                it.toCourtList()
            }
    }
    
}
