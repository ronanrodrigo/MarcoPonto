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
        let entriesNavigationController = EntriesNavigationController()
        let entriesNavigationControllerTabBarItem = UITabBarItem(title: "Pontos", image: UIImage.accessTime, selectedImage: nil)
        entriesNavigationController.tabBarItem = entriesNavigationControllerTabBarItem
        
        let reportsNavigationController = ReportsNavigationController()
        let reportsNavigationControllerTabBarItem = UITabBarItem(title: "Totais", image: UIImage.dateRange, selectedImage: nil)
        reportsNavigationController.tabBarItem = reportsNavigationControllerTabBarItem
        
        self.viewControllers = [entriesNavigationController, reportsNavigationController]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
