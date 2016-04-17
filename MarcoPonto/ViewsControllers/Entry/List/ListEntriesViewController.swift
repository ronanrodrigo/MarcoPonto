//
//  ListEntriesViewController.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class ListEntriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let dataSource = ListEntriesDataSource()
    let cellNameAndIdentifier = String(ListEntriesTableViewCell)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.registerNib(UINib(nibName: cellNameAndIdentifier, bundle: nil), forCellReuseIdentifier: cellNameAndIdentifier)
    }

}
