import UIKit
import MarcoPontoCore

protocol EditTableViewDelegate {
    func confirmDelete(punch: Punch, at indexPath: NSIndexPath)
}

class ListPunchsViewController: UIViewController, EditTableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    private let cellNameAndIdentifier = String(ListPunchsTableViewCell)
    private var dataSource: RRNListDataSource!
    private var delegate: ListPunchsDelegate!
    private var deletePunchPath: NSIndexPath?
    private var navigationDelegate: INavigationDelgate!

    init (navigationDelegate: INavigationDelgate) {
        self.navigationDelegate = navigationDelegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewWillAppear(animated: Bool) {
        configureTableView()
    }

    private func configureTableView() {
        dataSource = ListPunchsDataSource(editTableViewDelegate: self)
        tableView.dataSource = dataSource

        delegate = ListPunchsDelegate(navigationDelegate: navigationDelegate)
        tableView.delegate = delegate

        tableView.registerNib(
            UINib(nibName: cellNameAndIdentifier, bundle: nil), forCellReuseIdentifier: cellNameAndIdentifier)
        tableView.allowsSelectionDuringEditing = false

        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    func confirmDelete(punch: Punch, at indexPath: NSIndexPath) {
        deletePunchPath = indexPath

        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY, EEEE, HH:mm"

        let alert = UIAlertController(
            title: "Apagar Ponto",
            message: "Tem certeza que deseja apagar o ponto batido em \(dateFormatter.stringFromDate(punch.moment))?",
            preferredStyle: .ActionSheet)
        let deleteAction = UIAlertAction(title: "Sim", style: .Destructive, handler: handleDeletePunch)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .Cancel, handler: nil)

        alert.addAction(deleteAction)
        alert.addAction(cancelAction)

        presentViewController(alert, animated: true, completion: nil)
    }

    private func handleDeletePunch(alertAction: UIAlertAction!) -> Void {
        guard let indexPath = deletePunchPath else { return }
        tableView.beginUpdates()
        dataSource.removePunch(at: indexPath)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        deletePunchPath = nil
        tableView.endUpdates()
    }

    private func cancelDeltePunch(alertAction: UIAlertAction!) -> Void {
        deletePunchPath = nil
    }

}
