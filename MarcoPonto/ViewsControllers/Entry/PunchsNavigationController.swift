//
//  NavigationController.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

protocol INavigationDelgate {
    func editPunchFormViewController(punch: Punch)
}

class PunchsNavigationController: UINavigationController, SavePunchPresenter, INavigationDelgate {
    var listPunchsViewController: ListPunchsViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listPunchsViewController = ListPunchsViewController(navigationDelegate: self)
        openListPunchsViewController()
    }
    
    func openListPunchsViewController() {
        listPunchsViewController.navigationItem.title = "Pontos batidos"
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(newPunchFormViewController))
        listPunchsViewController.navigationItem.rightBarButtonItem = addButton
        setViewControllers([listPunchsViewController], animated: true)
    }
    
    func newPunchFormViewController() {
        let formPunchViewController = FormPunchViewController(savePunchPresenter: self, punch: nil)
        let saveButton = UIBarButtonItem(title: "Salvar", style: UIBarButtonItemStyle.Plain, target: formPunchViewController, action: #selector(formPunchViewController.savePunch))
        formPunchViewController.navigationItem.rightBarButtonItem = saveButton
        pushViewController(formPunchViewController, animated: true)
    }
    
    func editPunchFormViewController(punch: Punch) {
        let formPunchViewController = FormPunchViewController(savePunchPresenter: self, punch: punch)
        let saveButton = UIBarButtonItem(title: "Salvar", style: UIBarButtonItemStyle.Plain, target: formPunchViewController, action: #selector(formPunchViewController.savePunch))
        formPunchViewController.navigationItem.rightBarButtonItem = saveButton
        pushViewController(formPunchViewController, animated: true)
    }
    
    func didSavePunch() {
        popToViewController(listPunchsViewController, animated: true)
    }
}