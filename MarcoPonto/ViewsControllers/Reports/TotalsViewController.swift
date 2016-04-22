//
//  TotalsViewController.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 19/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class TotalsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var dataSource: TotalsDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        configureTableView()
    }
    
    private func configureTableView() {
        dataSource = TotalsDataSource()
        tableView.dataSource = dataSource
    }

}
