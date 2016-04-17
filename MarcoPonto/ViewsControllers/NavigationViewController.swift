//
//  NavigationViewController.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadListEntriesViewController()
    }
    
    func loadListEntriesViewController() {
        let formViewController = ListEntriesViewController()
        formViewController.navigationItem.title = "Pontos batidos"
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(loadFormEntryViewController))
        formViewController.navigationItem.rightBarButtonItem = addButton
        setViewControllers([formViewController], animated: true)
    }
    
    func loadFormEntryViewController() {
        let formEntryViewController = FormEntryViewController()
        pushViewController(formEntryViewController, animated: true)
    }
}
