//
//  ActivityViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 4/2/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ActivityViewController: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        configTabBar()
        super.viewDidLoad()
        //setPresenter()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        var pages = [UIViewController]()
        pages.append(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ActiveGameView"))
        pages.append(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CompletedGameView"))
        return pages
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
}
