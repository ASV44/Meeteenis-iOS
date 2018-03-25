//
//  SkillRatePresenter.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//


class SkillRatePresenter: BasePresenter<SkillRateView> {
    
    private let router: Router
    private let interactor: SkillRateInteractor
    
    init(router: Router, interactor: SkillRateInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
    func getQuizData() {
        execute(interactor.getQuizData(), onSkillsLoaded, onError)
    }
    
    func onSkillsLoaded(skills: [Skill]) {
        for skill in skills {
            print(skill)
        }
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
