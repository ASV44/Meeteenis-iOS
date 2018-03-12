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
    
    enum BallSkin: String {
        case active_ball, inactive_ball
    }
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var question: UITextView!
    @IBOutlet var balls: [UIImageView]!
    
    private var setRateListener: ((PagerViewCell) -> Void)!
    
    public var rate: Int = 0
    
    override func awakeFromNib() {
        initCellView()
    }
    
    func initCellView() {
        let screenSize = UIScreen.main.bounds
        question.font = question.font?.withSize(0.0338 * screenSize.width)
        
        for ball in balls {
            let listener = UITapGestureRecognizer(target: self, action: #selector(ballSelect(listener:)))
            ball.addGestureRecognizer(listener)
            ball.isUserInteractionEnabled = true
        }
    }
    
    func addSetRateListener(_ listenr: @escaping (PagerViewCell) -> Void) {
        setRateListener = listenr
    }
    
    @objc func ballSelect(listener: UITapGestureRecognizer) {
        let selectedBall = listener.view as! UIImageView
        let selectedRate = balls.index(of: selectedBall)! + 1
        setRate(selectedRate)
        setRateListener(self)
    }
    
    func setRate(_ rate: Int) {
        self.rate = rate
        for (index, ball) in balls.enumerated() {
            let skin = (0..<rate).contains(index) ? BallSkin.active_ball
                                                  : BallSkin.inactive_ball
            ball.image = UIImage(imageLiteralResourceName: skin.rawValue)
        }
    }
    
}
