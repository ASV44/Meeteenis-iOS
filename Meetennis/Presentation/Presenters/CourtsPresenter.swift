//
//  CourtsPresenter.swift
//  Meetennis
//
//  Created by Hackintosh on 6/8/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

class CourtsPresenter: BasePresenter<CourtsView> {
    
    private let router: Router
    private let interactor: CourtsInteractor
    
    init(router: Router, interactor: CourtsInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
    func getCourtsList() {
        execute(interactor.getCourtsList(), view.onCourtsListReceived, onError)
    }
    
}
