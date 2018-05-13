//
//  ProfileView.swift
//  Meetennis
//
//  Created by Hackintosh on 5/13/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

protocol ProfileView {
    func onPersonalDataReceive(data: UserMe)
    func onError(error: Errors.Error)
}
