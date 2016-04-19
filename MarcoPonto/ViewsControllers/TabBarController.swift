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
        let entriesNavigationControllerTabBarItem = UITabBarItem(title: "Pontos", image: UIImage(named: "ic_access_time"), tag: 1)
        entriesNavigationController.tabBarItem = entriesNavigationControllerTabBarItem
        self.viewControllers = [entriesNavigationController]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
