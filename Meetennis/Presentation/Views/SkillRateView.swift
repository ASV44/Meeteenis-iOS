//
//  SkillRateView.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//


protocol SkillRateView: BaseView {
    func updateSkillsList(with skills: [SkillItem])
}
