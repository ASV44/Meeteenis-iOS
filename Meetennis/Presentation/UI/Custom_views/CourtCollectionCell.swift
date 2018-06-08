//
//  CourtListCell.swift
//  Meetennis
//
//  Created by Hackintosh on 6/6/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class CourtCollectionCell: BaseCollectionCell {
    
    @IBOutlet weak var courtImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.bounds
    }
    
    func setCellData(data: Court) {
        name.text = data.name
        location.text = data.address.city + ", " + data.address.countryCode
        courtImage.kf.setImage(with: URL(string: data.pictures[0].url))
    }
    
    @IBAction func onCourtSelect(_ sender: Any) {
    }
}
