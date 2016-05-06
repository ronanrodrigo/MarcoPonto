import UIKit

class ReportsNavigationController: UINavigationController {

    var totalsViewController: TotalsViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        totalsViewController = TotalsViewController()
        openListPunchsViewController()

        navigationBar.tintColor = UIColor.primary
    }

    func openListPunchsViewController() {
        totalsViewController.navigationItem.title = "Relatório"
        setViewControllers([totalsViewController], animated: true)
    }
}
