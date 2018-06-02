//
//  UsersPresenter.swift
//  Meetennis
//
//  Created by Hackintosh on 5/13/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

class UsersPresenter: BasePresenter<UsersView> {
    
    private let router: Router
    private let interactor: UsersInteractor
    
    init(router: Router, interactor: UsersInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
    func getUsersList() {
        execute(interactor.getUsers(), view.onUsersListReceived, onError)
    }
    
}
