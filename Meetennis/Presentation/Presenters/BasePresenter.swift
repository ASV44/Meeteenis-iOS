//
//  BasePresenter.swift
//  Meetennis
//
//  Created by Hackintosh on 3/18/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift

class BasePresenter<V>  {
    
    internal var view: V!
    
    private let subscriptions: CompositeDisposable
    
    init() {
        self.subscriptions = CompositeDisposable()
    }
    
    func viewDidLoad() { }
    
    func execute<T>(_ observable: Observable<T>, _ onNext: @escaping (T) -> (), _ onError: @escaping (Error) -> ()) {
        let scheduler = ConcurrentDispatchQueueScheduler(queue: DispatchQueue.global())
        let subscription = observable.subscribeOn(scheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { data in
                onNext(data)
            }, onError: { error in
                onError(error)
            })
        subscriptions.insert(subscription)
    }
    
    func onError(error: Error) {
        let view = self.view as! BaseView
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
