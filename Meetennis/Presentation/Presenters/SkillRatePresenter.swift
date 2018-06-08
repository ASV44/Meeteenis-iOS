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
    
    func submitSkillsResults(skills: [SkillItem]) {
        let observable = interactor.submitSkillsRates(skillRates: skills.map { $0.toSkillRate() })
        execute(observable, onSubmitSuccess, onError)
    }
    
    func onSkillsLoaded(skills: [Skill]) {
        if skills.isEmpty {
            router.showAuthenticatedVC(animated: true)
        }
        view.updateSkillsList(with: skills.map { $0.toSkillItem() })
    }
    
    func onSubmitSuccess() {
        router.showAuthenticatedVC(animated: true)
    }
    
}
