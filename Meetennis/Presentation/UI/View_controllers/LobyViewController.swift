//
//  LobyViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 4/2/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class LobyViewController: BaseViewController<LobyView, LobyPresenter>, LobyView {
    
    @IBOutlet weak var court: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenter()
        
        initView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setPresenter() {
        presenter = LobyPresenter(router: Router(viewController: self), interactor: LobyInteractor())
        presenter.view = self
    }
    
    func initView() {
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(selectCourtTime(sender:)))
        court.addGestureRecognizer(gesture)
    }
    
    @objc func selectCourtTime(sender : UITapGestureRecognizer) {
        let vc = TabsTimePickerContainer(nibName: "TabsTimePickerContainer", bundle: nil)
        let editRadiusAlert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.alert)
        editRadiusAlert.setValue(vc, forKey: "contentViewController")
        editRadiusAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        editRadiusAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.presenter.onMatchTimeSet()
        }))
        self.present(editRadiusAlert, animated: true)
    }
}
