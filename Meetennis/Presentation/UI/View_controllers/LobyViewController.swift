//
//  LobyViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 4/2/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class LobyViewController: BaseViewController<LobyView, LobyPresenter>, LobyView {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenter()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setPresenter() {
        presenter = LobyPresenter(router: Router(viewController: self), interactor: LobyInteractor())
        presenter.view = self
    }
}
