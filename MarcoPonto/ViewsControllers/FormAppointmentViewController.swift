//
//  FormAppointmentViewController.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class FormAppointmentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let dataSource: FormAppointmentTableViewDataSource = FormAppointmentTableViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func configureTableView() {
        let identifier = String(SelectDateTableViewCell)
        let selectDateTableViewCell = UINib(nibName: identifier, bundle: nil)
        tableView.registerNib(selectDateTableViewCell, forCellReuseIdentifier: identifier)
        tableView.dataSource = dataSource
    }

}
