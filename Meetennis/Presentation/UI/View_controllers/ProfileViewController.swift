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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setPresenter()
        
        updateChart()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func signOutCLick(_ sender: Any) {
        //LoginUtils.logout(vc: self)
    }
    
    func updateChart() {
        var chartDataSet = [RadarChartDataSet]()
        
        for i in 0 ..< 1 {
            var dataEntries = [RadarChartDataEntry]()
            for j in 0 ..< 5 {
                dataEntries.append(RadarChartDataEntry(value: Double(arc4random_uniform(100))))
            }
             chartDataSet.append(RadarChartDataSet(values: dataEntries, label: "Skill Rates"))
        }
        radarChart.data = RadarChartData(dataSets: chartDataSet)
    }
}
