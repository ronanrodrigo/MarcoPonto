import UIKit
import MarcoPontoCore

protocol INavigationDelgate {
    func editPunchFormViewController(punch: Punch)
}

class PunchsNavigationController: UINavigationController, SavePunchPresenter, INavigationDelgate {
    var listPunchsViewController: ListPunchsViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        openListPunchsViewController()
    }

    func openListPunchsViewController() {
        listPunchsViewController = ListPunchsViewController(navigationDelegate: self)
        listPunchsViewController.navigationItem.title = "Pontos batidos"
        let addButton = UIBarButtonItem(
            barButtonSystemItem: .Add, target: self, action: #selector(newPunchFormViewController))
        listPunchsViewController.navigationItem.rightBarButtonItem = addButton
        navigationBar.tintColor = UIColor.primary
        setViewControllers([listPunchsViewController], animated: true)
    }

    func newPunchFormViewController() {
        let formPunchViewController = FormPunchViewController(savePunchPresenter: self, punch: nil)
        let saveButton = UIBarButtonItem(
            title: "Salvar",
            style: UIBarButtonItemStyle.Plain,
            target: formPunchViewController,
            action: #selector(formPunchViewController.savePunch))
        formPunchViewController.navigationItem.rightBarButtonItem = saveButton
        pushViewController(formPunchViewController, animated: true)
    }

    func editPunchFormViewController(punch: Punch) {
        let formPunchViewController = FormPunchViewController(savePunchPresenter: self, punch: punch)
        let saveButton = UIBarButtonItem(
            title: "Salvar",
            style: UIBarButtonItemStyle.Plain,
            target: formPunchViewController,
            action: #selector(formPunchViewController.savePunch))
        formPunchViewController.navigationItem.rightBarButtonItem = saveButton
        pushViewController(formPunchViewController, animated: true)
    }

    func didSavePunch() {
        popToViewController(listPunchsViewController, animated: true)
    }
}
