//
//  CourtsViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 6/6/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class CourtsViewController: UIViewController {
    
    private let gradient : CAGradientLayer = CAGradientLayer()
    
    let cellIdentifier = "CourtCollectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setPresenter()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

//MARK: Implementing CollectionViewDataSource
extension CourtsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        return cell
    }
}


//MARK: Implementing CollectionViewDelegate
extension CourtsViewController: UICollectionViewDelegate {
    
}
