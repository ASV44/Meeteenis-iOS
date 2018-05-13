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

class ProfileViewController: UIViewController, ProfileView {
    
    var presenter: ProfilePresenter!
    
    @IBOutlet weak var radarChart: RadarChartView!
    @IBOutlet weak var balanceBackground: UIView!
    @IBOutlet weak var statusBar: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UIImageView!
    @IBOutlet weak var location: UILabel!
    
    private var radarChartController: RadarChartController!
    
    private let gradient : CAGradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenter()

        initView()
        presenter.getPersonalData()
        presenter.getUserList()
        radarChartController = RadarChartController(radarChart: radarChart)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setPresenter() {
        presenter = ProfilePresenter(router: Router(viewController: self), interactor: ProfileInteractor(userMeGateway: UsersDataRepository(apiService: APICommunication())))
        presenter.view = self
    }
    
    func initView() {
        gradient.frame = statusBar.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.colors = [UIColor(red: 80 / 255, green: 10 / 255, blue: 35 / 255, alpha: 1).cgColor,
                           UIColor(red: 110 / 255, green: 15 / 255, blue: 45 / 255, alpha: 1).cgColor]
        statusBar.layer.insertSublayer(gradient, at: 0)
        image.layer.cornerRadius = image.frame.height/2
        image.layer.masksToBounds = false
        image.clipsToBounds = true
    }
    
    @IBAction func signOutCLick(_ sender: Any) {
        //LoginUtils.logout(vc: self)
    }
    
    func onPersonalDataReceive(data: UserMe) {
        print(data.pictureUrl)
        image.kf.setImage(with: URL(string: data.pictureUrl))
    }

    func onError(error: Errors.Error) {
        let alert = UIAlertController(title: nil, message: error.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            alert!.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
