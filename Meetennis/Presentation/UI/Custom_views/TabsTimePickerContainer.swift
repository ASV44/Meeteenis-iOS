//
//  TabsTimePickerContainer.swift
//  Meetennis
//
//  Created by Hackintosh on 6/5/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TabsTimePickerContainer: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        configTabBar()
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [getTimePicker("Start"), getTimePicker("End")]
    }
    
    func configTabBar() {
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.buttonBarItemFont = .systemFont(ofSize: 0.0271 * UIScreen.main.bounds.height)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarMinimumLineSpacing = 0
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?,
            progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .gray
            newCell?.label.textColor = .black
        }
    }
    
    func getTimePicker(_ indicator: String) -> UIViewController {
        let vc = TimePickerController()
        vc.indicatorInfo = indicator
        
        return vc
    }
}
