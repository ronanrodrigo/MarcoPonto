//
//  ListEntriesViewController.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

protocol EditTableViewDelegate {
    func confirmDelete(entry: Entry, at indexPath: NSIndexPath)
}

class ListEntriesViewController: UIViewController, EditTableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    private let cellNameAndIdentifier = String(ListEntriesTableViewCell)
    private var dataSource: ListEntriesDataSource!
    private var delegate: ListEntriesDelegate!
    private var deleteEntryPath: NSIndexPath?
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
    
    private func configureTableView() {
        dataSource = ListEntriesDataSource(editTableViewDelegate: self)
        tableView.dataSource = dataSource
        
        delegate = ListEntriesDelegate(navigationDelegate: navigationDelegate)
        tableView.delegate = delegate
        
        tableView.registerNib(UINib(nibName: cellNameAndIdentifier, bundle: nil), forCellReuseIdentifier: cellNameAndIdentifier)
        tableView.allowsSelectionDuringEditing = false
    }

    func confirmDelete(entry: Entry, at indexPath: NSIndexPath) {
        deleteEntryPath = indexPath
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY, EEEE, HH:mm"
        
        let alert = UIAlertController(title: "Apagar Ponto", message: "Tem certeza que deseja apagar o ponto batido em \(dateFormatter.stringFromDate(entry.moment))?", preferredStyle: .ActionSheet)
        let deleteAction = UIAlertAction(title: "Sim", style: .Destructive, handler: handleDeleteEntry)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .Cancel, handler: nil)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    private func handleDeleteEntry(alertAction: UIAlertAction!) -> Void {
        if let indexPath = deleteEntryPath {
            tableView.beginUpdates()
            dataSource.removeEntry(at: indexPath)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            deleteEntryPath = nil
            tableView.endUpdates()
        }
    }
    
    private func cancelDelteEntry(alertAction: UIAlertAction!) -> Void {
        deleteEntryPath = nil
    }

}
