//
//  NavigationViewController.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadListEntriesViewController()
    }
    
    func loadListEntriesViewController() {
        let formViewController = ListEntriesViewController()
        formViewController.navigationItem.title = "Pontos batidos"
        setViewControllers([formViewController], animated: true)
    }
}
