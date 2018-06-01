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
