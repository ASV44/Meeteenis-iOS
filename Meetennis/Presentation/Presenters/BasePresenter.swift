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
    
    func execute<T>(_ observable: Observable<T>, _ onNext: @escaping (T) -> Void, _ onError: @escaping (Error) -> Void) {
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
}
