//
//  UsersListCell.swift
//  Meetennis
//
//  Created by Hackintosh on 4/15/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class UsersListCell: BaseListCell {
    

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var userTag: UILabel!
    
    override func awakeFromNib() {
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.layer.masksToBounds = false
        userImage.clipsToBounds = true
    }
    
    func setCell(for user: User) {
        if(user.pictureUrl != nil) {
            userImage.kf.setImage(with: URL(string: user.pictureUrl))
        }
        name.text =  user.firstName + " " + user.lastName
        //location
        
    }
}
