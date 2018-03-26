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

class SkillRateViewController: UIViewController, SkillRateView {
    
    var presenter: SkillRatePresenter!
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var pagerView: FSPagerView!
    @IBOutlet weak var submitButton: UIButton!
    
    let cellLayoutIdentifier = "PagerViewCell"
    let cellIdentifier = "pagerViewCell"
    
    var totalElements = 0
    var quizData: [SkillItem]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenter()
        presenter.getQuizData()
        viewConfig(screenSize: UIScreen.main.bounds)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setPresenter() {
        presenter = SkillRatePresenter(router: Router(viewController: self),
                                       interactor: SkillRateInteractor(skillGateWay: SkillDataRepository(apiService: APICommunication()),
                                                                       userMeGateway: UserMeRepository(apiService: APICommunication())))
        presenter.view = self
    }
    
    func viewConfig(screenSize: CGRect) {
        let customCellNib = UINib(nibName: cellLayoutIdentifier, bundle: nil)
        pagerView.register(customCellNib, forCellWithReuseIdentifier: cellIdentifier)
        pagerView.transformer = FSPagerViewTransformer(type: .linear)
        pagerView.transformer?.minimumScale = 0.8
        pagerView.interitemSpacing = 0.75
        pagerView.itemSize = CGSize(width: 0.772 * screenSize.width,
                                    height: 0.407 * screenSize.height)
        pagerView.backgroundColor = UIColor.clear
    }
    
    func updateSkillsList(with skills: [SkillItem]) {
        totalElements = skills.count
        quizData = skills
        pagerView.reloadData()
        pagerView.isHidden = false
        setSkillIcon(for: pagerView.currentIndex)
        icon.isHidden = false
    }
    
    func setSkillIcon(for index: Int) {
        let url = URL(string: quizData[index].imageUrl)
        icon.kf.setImage(with: url)
    }
    
    func updateSkillRate(for cell: PagerViewCell) {
        self.quizData[pagerView.currentIndex].rating = cell.rate
    }
    
    @IBAction func submitSkillRate(_ sender: Any) {
        presenter.submitSkillsResults(skills: quizData)
    }
    
    func onError(error: Errors.Error) {
        let alert = UIAlertController(title: nil, message: error.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            alert!.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
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
        pagerCell.setRate(quizData[index].rating)
        pagerCell.title.text = quizData[index].name
        pagerCell.question.text = quizData[index].description

    }
    
    public func pagerViewDidEndDecelerating(_ pagerView: FSPagerView) {
        setSkillIcon(for: pagerView.currentIndex)
        if submitButton.isHidden == true &&
            pagerView.currentIndex == totalElements - 1 {
            submitButton.isHidden = false
        }
    }
}
