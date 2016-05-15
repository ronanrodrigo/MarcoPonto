import UIKit
import MarcoPontoCore

protocol EditTableViewDelegate {
    func confirmDelete(punch: Punch, at indexPath: NSIndexPath)
}

class ListPunchsViewController: UIViewController, EditTableViewDelegate {

    @IBOutlet weak var toggleDatePickerFilter: UIButton!
    @IBOutlet weak var datePickerBottomConstraints: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datePickerFilter: UIDatePicker!

    private let cellNameAndIdentifier = String(ListPunchsTableViewCell)
    private var dataSource: RRNListDataSource!
    private var delegate: ListPunchsDelegate!
    private var deletePunchPath: NSIndexPath?
    private var navigationDelegate: INavigationDelgate!
    private let dateFormatter = NSDateFormatter()
    private var selectedDate = NSDate()

    init (navigationDelegate: INavigationDelgate) {
        self.navigationDelegate = navigationDelegate
        self.dateFormatter.dateStyle = .LongStyle
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewWillAppear(animated: Bool) {
        updateToggleDatePickerFilterTitle()
        configureTableViewDataSource()
        configureTableView()
    }

    private func configureTableView() {
        delegate = ListPunchsDelegate(navigationDelegate: navigationDelegate)
        tableView.delegate = delegate

        tableView.registerNib(
            UINib(nibName: cellNameAndIdentifier, bundle: nil), forCellReuseIdentifier: cellNameAndIdentifier)
        tableView.allowsSelectionDuringEditing = false

        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    private func configureTableViewDataSource() {
        dataSource = ListPunchsDataSource(editTableViewDelegate: self, day: selectedDate)
        tableView.dataSource = dataSource
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

    private func updateToggleDatePickerFilterTitle() {
        let formattedDate = dateFormatter.stringFromDate(selectedDate)
        toggleDatePickerFilter.setTitle(formattedDate, forState: UIControlState.Normal)
    }

    @IBAction func didChangedDateFilter(sender: UIDatePicker) {
        selectedDate = sender.date
        updateToggleDatePickerFilterTitle()
        configureTableViewDataSource()
        tableView.reloadData()
    }

    @IBAction func didTappedAtToggleDatePicker(sender: AnyObject) {
        let hideDatePickerPosition = -(datePickerFilter.frame.height)
        let displayDatePickerPosition: CGFloat = 0.0

        if datePickerBottomConstraints.constant == displayDatePickerPosition {
            datePickerBottomConstraints.constant = hideDatePickerPosition
        } else {
            datePickerBottomConstraints.constant = displayDatePickerPosition
        }

        UIView.animateWithDuration(
            0.2,
            delay: 0.0,
            options: UIViewAnimationOptions.CurveLinear,
            animations: { self.view.layoutIfNeeded() },
            completion: nil
        )
    }
}
