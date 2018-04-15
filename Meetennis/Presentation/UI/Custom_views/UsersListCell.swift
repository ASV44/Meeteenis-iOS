//
//  UsersListCell.swift
//  Meetennis
//
//  Created by Hackintosh on 4/15/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class UsersListCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    
    override func layoutSubviews() {
        self.contentView.backgroundColor = UIColor(red: 240 / 250,
                                                   green: 240 / 250,
                                                   blue: 240 / 250,
                                                   alpha: 1)
        
        cardView.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(),
                                                 components: [1.0, 1.0, 1.0, 0.9])
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 5.0
        cardView.layer.shadowOffset = CGSize(width: -1, height: 1)
        cardView.layer.shadowOpacity = 0.5
        cardView.backgroundColor = UIColor.white
    }
}
