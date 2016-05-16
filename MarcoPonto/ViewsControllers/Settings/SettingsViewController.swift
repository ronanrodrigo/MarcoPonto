import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var dataSource: SettingsDataSource?

    init() {
        self.dataSource = SettingsDataSource()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    private func configureTableView() {
        let facebookCellIdentifier = String(FacebookTableViewCell)
        let facebookTableViewCell = UINib(nibName: facebookCellIdentifier, bundle: nil)
        tableView.registerNib(facebookTableViewCell, forCellReuseIdentifier: facebookCellIdentifier)

        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

}
