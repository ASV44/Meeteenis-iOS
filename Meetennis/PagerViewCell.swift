//
//  PagerViewCell.swift
//  Meetennis
//
//  Created by Hackintosh on 2/13/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit
import FSPagerView

class PagerViewCell:  FSPagerViewCell{
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var question: UITextView!
    @IBOutlet var balls: [UIImageView]!
    
    override func awakeFromNib() {
        let screenSize = UIScreen.main.bounds
        question.font = question.font?.withSize(0.0338 * screenSize.width)
    }
    
}
