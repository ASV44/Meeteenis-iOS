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
        self.view.backgroundColor = .clear
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.preferredContentSize = CGSize(width: 300,height: 0.407 * UIScreen.main.bounds.height)
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [getTimePicker("Start Time"), getTimePicker("End Time")]
    }
    
    func configTabBar() {
        settings.style.buttonBarItemBackgroundColor = .clear//UIColor(red: 129 / 255, green: 28 / 255, blue: 64 / 255, alpha: 1)
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
        let vc = TimePickerController(nibName: "TimePickerController", bundle: nil)
        vc.indicatorInfo = indicator
        
        return vc
    }
}
