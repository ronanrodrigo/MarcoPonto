//
//  NavigationController.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

protocol INavigationDelgate {
    func editEntryFormViewController(entry: Entry)
}

class EntriesNavigationController: UINavigationController, SaveEntryPresenter, INavigationDelgate {
    var listEntriesViewController: ListEntriesViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listEntriesViewController = ListEntriesViewController(navigationDelegate: self)
        openListEntriesViewController()
    }
    
    func openListEntriesViewController() {
        listEntriesViewController.navigationItem.title = "Pontos batidos"
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(newEntryFormViewController))
        listEntriesViewController.navigationItem.rightBarButtonItem = addButton
        setViewControllers([listEntriesViewController], animated: true)
    }
    
    func newEntryFormViewController() {
        let formEntryViewController = FormEntryViewController(saveEntryPresenter: self, entry: nil)
        let saveButton = UIBarButtonItem(title: "Salvar", style: UIBarButtonItemStyle.Plain, target: formEntryViewController, action: #selector(formEntryViewController.saveEntry))
        formEntryViewController.navigationItem.rightBarButtonItem = saveButton
        pushViewController(formEntryViewController, animated: true)
    }
    
    func editEntryFormViewController(entry: Entry) {
        let formEntryViewController = FormEntryViewController(saveEntryPresenter: self, entry: entry)
        let saveButton = UIBarButtonItem(title: "Salvar", style: UIBarButtonItemStyle.Plain, target: formEntryViewController, action: #selector(formEntryViewController.saveEntry))
        formEntryViewController.navigationItem.rightBarButtonItem = saveButton
        pushViewController(formEntryViewController, animated: true)
    }
    
    func didSaveEntry() {
        popToViewController(listEntriesViewController, animated: true)
    }
}
