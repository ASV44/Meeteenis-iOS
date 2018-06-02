//
//  BaseViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 6/2/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class BaseViewController<V, T: BasePresenter<V>>: UIViewController, BaseView {
    
    var presenter: T!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func onError(error: Errors.Error) {
        let alert = UIAlertController(title: nil, message: error.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            alert!.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
