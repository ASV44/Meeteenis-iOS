//
//  UsersViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 4/2/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController, UsersView {
    
    var presenter: UsersPresenter!
    
    @IBOutlet weak var usersList: UITableView!
    
    var usersListData: [User]! = [User]()
    
    let cellIdentifier = "UsersListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenter()
        
        presenter.getUsersList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setPresenter() {
        presenter = UsersPresenter(router: Router(viewController: self), interactor: UsersInteractor(userMeGateway: UsersDataRepository(apiService: APICommunication())))
        presenter.view = self
    }
    
    func onUsersListReceived(data: [User]) {
        usersListData = data
        usersList.reloadData()
    }
    
    func onError(error: Errors.Error) {
        let alert = UIAlertController(title: nil, message: error.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            alert!.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: Implement table view data source
extension UsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0.19 * UIScreen.main.bounds.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UsersListCell
        cell.setCell(for: usersListData[indexPath.row])
        
        return cell
    }
}

// MARK: Implement table view delegate
extension UsersViewController: UITableViewDelegate {
    
}
