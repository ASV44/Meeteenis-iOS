//
//  AuthenticatedViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 3/24/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var radarChart: RadarChartView!
    @IBOutlet weak var balanceBackground: UIView!
    @IBOutlet weak var statusBar: UIView!
    
    private var radarChartController: RadarChartController!
    
    private let gradient : CAGradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setPresenter()

        initView()
        radarChartController = RadarChartController(radarChart: radarChart)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initView() {
        gradient.frame = statusBar.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.colors = [UIColor(red: 80 / 255, green: 10 / 255, blue: 35 / 255, alpha: 1).cgColor,
                           UIColor(red: 110 / 255, green: 15 / 255, blue: 45 / 255, alpha: 1).cgColor]
        statusBar.layer.insertSublayer(gradient, at: 0)
    }
    
    @IBAction func signOutCLick(_ sender: Any) {
        //LoginUtils.logout(vc: self)
    }
    

}
