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
    let cellNameAndIdentifier = String(ListEntriesTableViewCell)
    var dataSource: ListEntriesDataSource!
    var delegate: ListEntriesDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        configureTableView()
    }
    
    func configureTableView() {
        dataSource = ListEntriesDataSource()
        tableView.dataSource = dataSource
        
        delegate = ListEntriesDelegate()
        tableView.delegate = delegate
        
        tableView.registerNib(UINib(nibName: cellNameAndIdentifier, bundle: nil), forCellReuseIdentifier: cellNameAndIdentifier)
    }

}
