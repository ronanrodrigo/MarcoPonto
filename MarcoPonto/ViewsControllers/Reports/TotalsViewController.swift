import UIKit

class TotalsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var dataSource: TotalsDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        configureTableView()
    }

    private func configureTableView() {
        dataSource = TotalsDataSource()
        tableView.dataSource = dataSource
    }

}
