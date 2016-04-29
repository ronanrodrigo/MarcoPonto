import UIKit

class FormPunchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: FormPunchDataSource?
    private var savePunchPresenter: SavePunchPresenter?
    private var punch: Punch?
    
    init(savePunchPresenter: SavePunchPresenter, punch: Punch?) {
        self.savePunchPresenter = savePunchPresenter
        self.punch = punch
        self.dataSource = FormPunchDataSource(punch: punch)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 250

        let selectMomentIdentifier = String(SelectMomentTableViewCell)
        let selectDateTableViewCell = UINib(nibName: selectMomentIdentifier, bundle: nil)
        tableView.registerNib(selectDateTableViewCell, forCellReuseIdentifier: selectMomentIdentifier)
        
        let selectTypeIdentifier = String(SelectTypeTableViewCell)
        let selectTypeTableViewCell = UINib(nibName: selectTypeIdentifier, bundle: nil)
        tableView.registerNib(selectTypeTableViewCell, forCellReuseIdentifier: selectTypeIdentifier)
        
        tableView.dataSource = dataSource
    }
    
    func savePunch() {
        if let _savePunchPresenter = savePunchPresenter, let _dataSource = dataSource {
            let usecase = SavePunchUsecaseFactory.make(presenter: _savePunchPresenter)
            let filledPunch = _dataSource.filledPunch()
            usecase.save(filledPunch)
        }
    }

}
