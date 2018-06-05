//
//  TimePickerController.swift
//  Meetennis
//
//  Created by Hackintosh on 6/5/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TimePickerController: UIViewController, IndicatorInfoProvider {
    
    var indicatorInfo: String!
    var size: CGRect!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let pickerView = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        self.view.addSubview(pickerView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: indicatorInfo)
    }
}
