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

class SkillRateViewController: UIViewController {
    
    private let Url = "https://meetennis-api-test.azurewebsites.net/api/skill"
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var pagerView: FSPagerView!
    
    let cellLayoutIdentifier = "PagerViewCell"
    let cellIdentifier = "pagerViewCell"
    
    var totalElements = 0
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
    
    func initView(with data: JSON) {
        totalElements = data["totalElements"].int!
        quizData = data["data"].array
        pagerView.reloadData()
        pagerView.isHidden = false
        quizRate = [Int](repeating: 0, count: totalElements)
        setSkillIcon(for: pagerView.currentIndex)
        icon.isHidden = false
    }
    
    @IBAction func signOutCLick(_ sender: Any) {
        LoginUtils.logout(vc: self)
    }
    
    func setSkillIcon(for index: Int) {
        let url = URL(string: quizData[index]["iconUrl"].string!)
        icon.kf.setImage(with: url)
    }
}

// MARK: Implement pager view data source
extension SkillRateViewController: FSPagerViewDataSource {
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return totalElements
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, at: index)
        return cell
    }
}

// MARK: Implement pager view delegate
extension SkillRateViewController: FSPagerViewDelegate {
    
    public func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        let pagerCell = cell as! PagerViewCell
        pagerCell.setRate(quizRate[index])
        if quizData != nil {
            pagerCell.title.text = quizData[index]["name"].string
            pagerCell.question.text = quizData[index]["description"].string

        }
    }
    
    public func pagerView(_ pagerView: FSPagerView, didEndDisplaying cell: FSPagerViewCell, forItemAt index: Int) {
        let pagerCell = cell as! PagerViewCell
        quizRate[index] = pagerCell.rate
    }
    
    public func pagerViewDidEndDecelerating(_ pagerView: FSPagerView) {
        setSkillIcon(for: pagerView.currentIndex)
    }
    
}

// MARK: Implement API comunication
extension SkillRateViewController {
    
    func getQuizData() {
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + KeyChainUtils.getAccesToken(),
        ]

        Alamofire.request(Url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            print(response.response!.statusCode)
            switch response.result {
            case .success(let value):
                let responseData = JSON(value)
                //print(response)
                self.initView(with: responseData)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
