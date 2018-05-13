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
        execute(observable, onDataArrived, onError)
    }
    
    func getUserList() {
        execute(interactor.getUsers(), onUserListArruved, onError)
    }
    
    func onDataArrived(profileData: UserMe) {
        view.onPersonalDataReceive(data: profileData)
    }
    
    func onUserListArruved(usersList: [User]) {
        for user in usersList {
            print(user)
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
