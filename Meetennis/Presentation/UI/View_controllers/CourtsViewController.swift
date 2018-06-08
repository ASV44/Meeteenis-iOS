//
//  CourtsViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 6/6/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class CourtsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let gradient : CAGradientLayer = CAGradientLayer()
    
    let cellIdentifier = "CourtCollectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setPresenter()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
}

//MARK: Implementing CollectionViewDataSource
extension CourtsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.contentView.frame = cell.bounds
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 0.5 * UIScreen.main.bounds.width,
                      height: 0.349 * UIScreen.main.bounds.height)
    }
}


//MARK: Implementing CollectionViewDelegate
extension CourtsViewController: UICollectionViewDelegate {
}
