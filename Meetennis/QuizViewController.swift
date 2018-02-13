//
//  QuizViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 2/6/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit
import FSPagerView

class QuizViewController: UIViewController {
    
    @IBOutlet weak var pagerView: FSPagerView!
    
    let cellLayoutIdentifier = "PagerViewCell"
    let cellIdentifier = "pagerViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewConfig(screenSize: UIScreen.main.bounds)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewConfig(screenSize: CGRect) {
        let customCellNib = UINib(nibName: "PagerViewCell", bundle: nil)
        pagerView.register(customCellNib, forCellWithReuseIdentifier: cellIdentifier)
        pagerView.transformer = FSPagerViewTransformer(type: .linear)
        pagerView.transformer?.minimumScale = 0.8
        pagerView.interitemSpacing = 0.75
        pagerView.itemSize = CGSize(width: 0.772 * screenSize.width,
                                    height: 0.407 * screenSize.height)
        pagerView.backgroundColor = UIColor.clear
    }
    
    @IBAction func signOutCLick(_ sender: Any) {
        LoginUtils.logout(vc: self)
    }
}

// MARK: Implement pager view data source

extension QuizViewController: FSPagerViewDataSource {
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 10
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, at: index)
        return cell
    }
}
