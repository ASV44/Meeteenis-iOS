//
//  ActivityCompletedViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 4/16/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class CompletedGameViewController: UIViewController, IndicatorInfoProvider {
    
    let cellIdentifier = "CompletedGameListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setPresenter()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "COMPLETED")
    }
}


// MARK: Implement table view data source
extension CompletedGameViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10//usersListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CompletedGameListCell
        
        return cell
    }
}

// MARK: Implement table view delegate
extension CompletedGameViewController: UITableViewDelegate {
    
}
