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
    private var navigationDelegate: INavigationDelgate!
    
    init (navigationDelegate: INavigationDelgate) {
        self.navigationDelegate = navigationDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        configureTableView()
    }
    
    func configureTableView() {
        dataSource = ListEntriesDataSource()
        tableView.dataSource = dataSource
        
        delegate = ListEntriesDelegate(navigationDelegate: navigationDelegate)
        tableView.delegate = delegate
        
        tableView.registerNib(UINib(nibName: cellNameAndIdentifier, bundle: nil), forCellReuseIdentifier: cellNameAndIdentifier)
    }

}
