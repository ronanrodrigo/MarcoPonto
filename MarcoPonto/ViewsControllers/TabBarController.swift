//
//  TabBarController.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 18/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        let punchsNavigationController = PunchsNavigationController()
        let punchsNavigationControllerTabBarItem = UITabBarItem(title: "Pontos", image: UIImage.accessTime, selectedImage: nil)
        punchsNavigationController.tabBarItem = punchsNavigationControllerTabBarItem
        
        let reportsNavigationController = ReportsNavigationController()
        let reportsNavigationControllerTabBarItem = UITabBarItem(title: "Totais", image: UIImage.dateRange, selectedImage: nil)
        reportsNavigationController.tabBarItem = reportsNavigationControllerTabBarItem
        
        self.viewControllers = [punchsNavigationController, reportsNavigationController]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
