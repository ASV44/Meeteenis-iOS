//
//  Router.swift
//  Meetennis
//
//  Created by Hackintosh on 3/4/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class Router {
    
    private let viewController: UIViewController
    private let mainStoryboard: UIStoryboard
    
    init(viewController: UIViewController) {
        self.viewController = viewController
        mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    }
    
    func showLoginVC() {
        let loginVC = mainStoryboard.instantiateViewController(withIdentifier: "LoginView")
        viewController.present(loginVC, animated: false, completion: nil)
    }
    
    func showSkillRateVC() {
        let skillRateVC = mainStoryboard.instantiateViewController(withIdentifier: "QuizView")
        viewController.present(skillRateVC, animated: true, completion: nil)
    }
    
    func showAuthenticatedVC(animated: Bool) {
        let skillRateVC = mainStoryboard.instantiateViewController(withIdentifier: "AuthenticatedVC")
        viewController.present(skillRateVC, animated: animated, completion: nil)
    }
    
    func showCourtsListVC() {
        let courtsListVC = mainStoryboard.instantiateViewController(withIdentifier: "CourtsListVC")
        viewController.present(courtsListVC, animated: true, completion: nil)
    }
}
