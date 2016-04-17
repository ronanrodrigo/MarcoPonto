//
//  NavigationViewController.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController, SaveEntryPresenter {
    var listEntriesViewController: ListEntriesViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listEntriesViewController = ListEntriesViewController()
        openListEntriesViewController()
    }
    
    func openListEntriesViewController() {
        listEntriesViewController.navigationItem.title = "Pontos batidos"
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(openFormEntryViewController))
        listEntriesViewController.navigationItem.rightBarButtonItem = addButton
        setViewControllers([listEntriesViewController], animated: true)
    }
    
    func openFormEntryViewController() {
        let formEntryViewController = FormEntryViewController(saveEntryPresenter: self)
        let saveButton = UIBarButtonItem(title: "Salvar", style: UIBarButtonItemStyle.Plain, target: formEntryViewController, action: #selector(formEntryViewController.saveEntry))
        formEntryViewController.navigationItem.rightBarButtonItem = saveButton
        pushViewController(formEntryViewController, animated: true)
    }
    
    func didSaveEntry() {
        popToViewController(listEntriesViewController, animated: true)
    }
}
