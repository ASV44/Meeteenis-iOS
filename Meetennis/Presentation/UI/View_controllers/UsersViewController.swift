//
//  UsersViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 4/2/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    
    @IBOutlet weak var usersList: UITableView!
    
    var usersListData: [User]!
    
    let cellIdentifier = "UsersListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setPresenter()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

// MARK: Implement table view data source
extension UsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10//usersListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UsersListCell
        
        return cell
    }
}

// MARK: Implement table view delegate
extension UsersViewController: UITableViewDelegate {
    
}
