//
//  CourtsInteractor.swift
//  Meetennis
//
//  Created by Hackintosh on 6/8/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

class CourtsInteractor {
    
    private let gateway: CourtGateway
    
    init(gateway: CourtGateway) {
        self.gateway = gateway
    }
    
    func getCourtsList() -> Observable<[Court]> {
        return gateway.getCourts()
    }
}
