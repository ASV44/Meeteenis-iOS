//
//  UsersView.swift
//  Meetennis
//
//  Created by Hackintosh on 5/13/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

protocol UsersView: BaseView {
    func onUsersListReceived(data: [User])
}
