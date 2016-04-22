//
//  TotalsViewController.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 19/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class TotalsViewController: UIViewController, CurrentWeekHoursPresenter {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        CurrentWeekHoursUsecaseFactory.make(self).total()
    }

    func showTotal(total: NSTimeInterval) {
    }

}
