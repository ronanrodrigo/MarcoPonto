import UIKit

class SettingsNavigationController: UINavigationController {

    var settingsViewController: SettingsViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        openListPunchsViewController()
    }

    func openListPunchsViewController() {
        settingsViewController = SettingsViewController()
        settingsViewController.navigationItem.title = "Configurações"
        navigationBar.tintColor = UIColor.primary
        setViewControllers([settingsViewController], animated: true)
    }
}
