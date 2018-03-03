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
    @IBOutlet weak var submitButton: UIButton!
    
    let cellLayoutIdentifier = "PagerViewCell"
    let cellIdentifier = "pagerViewCell"
    
    var totalElements = 0
    var quizData: [JSON]!
    
    var quizRate: [Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getQuizData()
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
    
    func updateSkillRate(for cell: PagerViewCell) -> Void {
        self.quizRate[pagerView.currentIndex] = cell.rate
    }
    
    @IBAction func submitSkillRate(_ sender: Any) {
        postSkillsRate()
    }
}

// MARK: Implement pager view data source
extension SkillRateViewController: FSPagerViewDataSource {
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return totalElements
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, at: index) as! PagerViewCell
        cell.addSetRateListener(updateSkillRate)
        return cell
    }
}

// MARK: Implement pager view delegate
extension SkillRateViewController: FSPagerViewDelegate {
    
    public func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        let pagerCell = cell as! PagerViewCell
        pagerCell.setRate(quizRate[index])
        pagerCell.title.text = quizData[index]["name"].string
        pagerCell.question.text = quizData[index]["description"].string

    }
    
    public func pagerViewDidEndDecelerating(_ pagerView: FSPagerView) {
        setSkillIcon(for: pagerView.currentIndex)
        if submitButton.isHidden == true &&
            pagerView.currentIndex == totalElements - 1 {
            submitButton.isHidden = false
        }
    }
}

// MARK: Implement API comunication
extension SkillRateViewController {
    
    func getRequestHeader() -> HTTPHeaders {
        return ["Authorization": "Bearer " + KeyChainUtils.getAccesToken()]
    }
    
    func getQuizData() {
        Alamofire.request(Url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: getRequestHeader()).responseJSON { response in
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
    
    func postSkillsRate() {
        var request = URLRequest(url: try! Url.asURL())
        
        request.httpMethod = "POST"
        request.setValue("Bearer " + KeyChainUtils.getAccesToken(),
                         forHTTPHeaderField: "Authorization")
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        var parameters: [Parameters] = [Parameters]()
        for i in 0..<quizRate.count {
            let skillRate: Parameters = [
                "skill": quizData[i]["id"],
                "value": quizRate[i]
            ]
            parameters.append(skillRate)
        }
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)

        Alamofire.request(request).responseJSON { response in
            print(response.response!.statusCode)
            switch response.result {
            case .success(let value):
                //let responseData = JSON(value)
                print(response)
                print(value)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
