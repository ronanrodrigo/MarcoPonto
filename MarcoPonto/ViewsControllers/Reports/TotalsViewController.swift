import UIKit

class TotalsViewController: UIViewController {
    private var dataSource: TotalsDataSource!

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        configureTableView()
    }

    private func configureTableView() {
        dataSource = TotalsDataSource()
        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

}
