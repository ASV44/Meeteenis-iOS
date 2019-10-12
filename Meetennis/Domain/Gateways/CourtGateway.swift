//
//  CourtGateway.swift
//  Meetennis
//
//  Created by Hackintosh on 6/8/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

protocol CourtGateway {
    func getCourts() -> Observable<[Court]>
}
