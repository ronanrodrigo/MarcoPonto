import UIKit
import MarcoPontoCore

class WorkHoursTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var total: UILabel!

    func updateCell(workHour: WorkHour) {
        title.text = workHour.type.title
        balance.text = workHour.balance.toTimeString()
        total.text = workHour.total.toTimeString()

        if workHour.balance < 0 {
            balance.textColor = UIColor.primary
        } else {
            balance.textColor = UIColor.green
            balance.text = "+" + balance.text!
        }
    }

}
