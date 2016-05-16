import UIKit
import MarcoPontoCore

class SelectTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var typeSelector: UISegmentedControl!

    override func awakeFromNib() {
        separatorInset = UIEdgeInsetsZero
        preservesSuperviewLayoutMargins = false
        layoutMargins = UIEdgeInsetsZero
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func fillData(type: PunchType?) {
        if let _type = type {
            typeSelector.selectedSegmentIndex = _type.rawValue.integerValue
        }
    }

}
