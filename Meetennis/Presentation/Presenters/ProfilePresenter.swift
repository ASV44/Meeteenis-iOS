//
//  ProfilePresenter.swift
//  Meetennis
//
//  Created by Hackintosh on 5/13/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

class ProfilePresenter: BasePresenter<ProfileView> {
    
    private let router: Router
    private let interactor: ProfileInteractor
    
    init(router: Router, interactor: ProfileInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
    func getPersonalData() {
        let observable = interactor.getUserMeData()
        execute(observable, view.onPersonalDataReceive, onError)
    }
    
    func getSkillsRates() {
        execute(interactor.getSkillsRates(), view.onChartDataUpdate, onError)
    }
    
}
