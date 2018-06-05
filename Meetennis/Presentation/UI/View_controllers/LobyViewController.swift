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
        vc.preferredContentSize = CGSize(width: 300,height: 300)
//        let pickerView = UIDatePicker(frame: CGRect(x: 0, y: -30, width: 250, height: 250))
//        vc.view.addSubview(pickerView)
        let editRadiusAlert = UIAlertController(title: nil, message: "Choose match date and time", preferredStyle: UIAlertControllerStyle.alert)
        editRadiusAlert.setValue(vc, forKey: "contentViewController")
        editRadiusAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        editRadiusAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(editRadiusAlert, animated: true)
    }
}
