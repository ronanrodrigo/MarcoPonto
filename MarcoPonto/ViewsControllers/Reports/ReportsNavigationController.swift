//
//  ReportsNavigationController.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 19/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class ReportsNavigationController: UINavigationController {

    var totalsViewController: TotalsViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalsViewController = TotalsViewController()
        openListPunchsViewController()
    }
    
    func openListPunchsViewController() {
        totalsViewController.navigationItem.title = "Totais"
        setViewControllers([totalsViewController], animated: true)
    }
}
