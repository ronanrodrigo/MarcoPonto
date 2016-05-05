import UIKit

class TotalsViewController: UIViewController {
    private var dataSource: TotalsDataSource!
    private let cellNameAndIdentifier = String(WorkHoursTableViewCell)

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

        tableView.registerNib(
            UINib(nibName: cellNameAndIdentifier, bundle: nil),
            forCellReuseIdentifier: cellNameAndIdentifier)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

}
