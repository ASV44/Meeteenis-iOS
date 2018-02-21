//
//  QuizViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 2/6/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit
import FSPagerView
import Alamofire
import SwiftyJSON
import Kingfisher

class QuizViewController: UIViewController {
    
    private let URL = "https://meetennis-api-test.azurewebsites.net/api/skill"
    
    @IBOutlet weak var pagerView: FSPagerView!
    
    let cellLayoutIdentifier = "PagerViewCell"
    let cellIdentifier = "pagerViewCell"
    
    var totalElements = 10
    var quizData: [JSON]!
    
    var quizRate: [Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getQuizData()
        quizRate = [Int](repeating: 0, count: self.totalElements)
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
        return totalElements
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, at: index)
        return cell
    }
}

// MARK: Implement pager view delegate
extension QuizViewController: FSPagerViewDelegate {
    
    public func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        let pagerCell = cell as! PagerViewCell
        pagerCell.setRate(quizRate[index])
    }
    
    public func pagerView(_ pagerView: FSPagerView, didEndDisplaying cell: FSPagerViewCell, forItemAt index: Int) {
        let pagerCell = cell as! PagerViewCell
        quizRate[index] = pagerCell.rate
    }
}

// MARK: Implement API comunication

extension QuizViewController {
    func getQuizData() {
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + KeyChainUtils.getAccesToken(),
        ]

        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            print(response)
            print(response.response!.statusCode)
            switch response.result {
            case .success(let value):
                let response = JSON(value)
                print(response)
                self.totalElements = response["totalElements"].int!
                self.quizData = response["data"].array
                self.pagerView.reloadData()
                self.pagerView.isHidden = false
                self.quizRate = [Int](repeating: 0, count: self.totalElements)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
