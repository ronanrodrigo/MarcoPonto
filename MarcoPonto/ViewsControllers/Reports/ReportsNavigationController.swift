import UIKit

class ReportsNavigationController: UINavigationController {

    var totalsViewController: TotalsViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        openListPunchsViewController()
    }

    func openListPunchsViewController() {
        totalsViewController = TotalsViewController()
        totalsViewController.navigationItem.title = "Relatório"
        navigationBar.tintColor = UIColor.primary
        setViewControllers([totalsViewController], animated: true)
    }
}
