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
    
    func onError(error: Error) {
        switch error {
        case is HttpException:
            let exception = error as! HttpException
            view.onError(error: Errors.Error(code: exception.code, message: exception.message))
            break
        case is NetworkConnectionException:
            view.onError(error: Errors.NETWORK_CONNECTION_ERROR)
            break
        default:
            view.onError(error: Errors.GENERAL_ERROR)
        }
    }
    
}
