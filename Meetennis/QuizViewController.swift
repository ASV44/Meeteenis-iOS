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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        pagerView.transformer = FSPagerViewTransformer(type: .linear)
        pagerView.interitemSpacing = 1.5
        pagerView.itemSize = CGSize(width: 200, height: 250)
        pagerView.backgroundColor = UIColor.clear
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.backgroundColor = UIColor.white
        cell.clipsToBounds = true
        return cell
    }
}
