//
//  FormEntryViewController.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class FormEntryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: FormEntryDataSource?
    var saveEntryPresenter: SaveEntryPresenter?
    private var entry: Entry?
    
    init(saveEntryPresenter: SaveEntryPresenter, entry: Entry?) {
        self.saveEntryPresenter = saveEntryPresenter
        self.entry = entry
        self.dataSource = FormEntryDataSource(entry: entry)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 250

        let selectMomentIdentifier = String(SelectMomentTableViewCell)
        let selectDateTableViewCell = UINib(nibName: selectMomentIdentifier, bundle: nil)
        tableView.registerNib(selectDateTableViewCell, forCellReuseIdentifier: selectMomentIdentifier)
        
        let selectTypeIdentifier = String(SelectTypeTableViewCell)
        let selectTypeTableViewCell = UINib(nibName: selectTypeIdentifier, bundle: nil)
        tableView.registerNib(selectTypeTableViewCell, forCellReuseIdentifier: selectTypeIdentifier)
        
        tableView.dataSource = dataSource
    }
    
    func saveEntry() {
        if let _saveEntryPresenter = saveEntryPresenter, let _dataSource = dataSource {
            let usecase = SaveEntryUsecaseFactory.make(presenter: _saveEntryPresenter)
            let filledEntry = _dataSource.filledEntry()
            usecase.save(filledEntry)
        }
    }

}
