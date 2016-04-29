import UIKit

class SelectMomentTableViewCell: UITableViewCell {

    @IBOutlet weak var momentSelector: UIDatePicker!
    
    override func awakeFromNib() {
        separatorInset = UIEdgeInsetsZero
        preservesSuperviewLayoutMargins = false
        layoutMargins = UIEdgeInsetsZero
    }

    func fillData(moment: NSDate?) {
        if let _moment = moment {
            momentSelector.date = _moment
        }
    }
}
