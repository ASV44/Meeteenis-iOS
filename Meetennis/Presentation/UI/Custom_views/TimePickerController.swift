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
