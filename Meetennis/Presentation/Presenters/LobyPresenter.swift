//
//  LobyPresenter.swift
//  Meetennis
//
//  Created by Hackintosh on 6/2/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//


class LobyPresenter: BasePresenter<LobyView> {
    
    private let router: Router
    private let interactor: LobyInteractor
    
    init(router: Router, interactor: LobyInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
    func onMatchTimeSet() {
        router.showCourtsListVC()
    }
}
