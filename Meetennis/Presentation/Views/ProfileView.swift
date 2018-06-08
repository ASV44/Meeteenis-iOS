//
//  ProfileView.swift
//  Meetennis
//
//  Created by Hackintosh on 5/13/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

protocol ProfileView: BaseView {
    func onPersonalDataReceive(data: UserMe)
    func onChartDataUpdate(data: [SkillRate])
}
