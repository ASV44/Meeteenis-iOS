//
//  ActivityActiveViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 4/16/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ActiveGameViewController: UIViewController, IndicatorInfoProvider {
    
    let cellIdentifier = "ActiveGameListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setPresenter()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "ACTIVE")
    }
}

// MARK: Implement table view data source
extension ActiveGameViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.244
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10//usersListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ActiveGameListCell
        
        return cell
    }
}

// MARK: Implement table view delegate
extension ActiveGameViewController: UITableViewDelegate {
    
}
