//
//  AuthenticatedViewController.swift
//  Meetennis
//
//  Created by Hackintosh on 3/24/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit
import Charts
import CoreLocation

class ProfileViewController: BaseViewController<ProfileView, ProfilePresenter>, ProfileView {
    
    @IBOutlet weak var radarChart: RadarChartView!
    @IBOutlet weak var balanceBackground: UIView!
    @IBOutlet weak var statusBar: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    
    private var radarChartController: RadarChartController!
    
    private let gradient : CAGradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenter()

        initView()
        presenter.getPersonalData()
        presenter.getSkillsRates()
        radarChartController = RadarChartController(radarChart: radarChart)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        image.layer.cornerRadius = image.frame.height / 2
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setPresenter() {
        presenter = ProfilePresenter(router: Router(viewController: self), interactor: ProfileInteractor(userMeGateway: UsersDataRepository(apiService: APICommunication()),
                                                                                                         skillGateway: SkillDataRepository(apiService: APICommunication())))
        presenter.view = self
    }
    
    func initView() {
        gradient.frame = statusBar.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.colors = [UIColor(red: 80 / 255, green: 10 / 255, blue: 35 / 255, alpha: 1).cgColor,
                           UIColor(red: 110 / 255, green: 15 / 255, blue: 45 / 255, alpha: 1).cgColor]
        statusBar.layer.insertSublayer(gradient, at: 0)
        image.layer.masksToBounds = false
        image.clipsToBounds = true
    }
    
    @IBAction func signOutCLick(_ sender: Any) {
        //LoginUtils.logout(vc: self)
    }
    
    func onPersonalDataReceive(data: UserMe) {
        LocationUtils.getAddress(location: data.location, onAddressReceive: onAddressUpdate)
        image.kf.setImage(with: URL(string: data.pictureUrl))
        name.text = data.firstName + " " + data.lastName
    }
    
    func onAddressUpdate(placemark: CLPlacemark) {
        location.text = placemark.locality! + ", " + placemark.country!
    }
    
    func onChartDataUpdate(data: [SkillRate]) {
        radarChartController.updateChart(skillsRates: data)
    }
}
