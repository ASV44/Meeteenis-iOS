//
//  CourtListCell.swift
//  Meetennis
//
//  Created by Hackintosh on 6/6/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class CourtCollectionCell: BaseCollectionCell {
    
    @IBOutlet weak var selectButton: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.bounds
    }
    
    @IBAction func onCourtSelect(_ sender: Any) {
    }
}
