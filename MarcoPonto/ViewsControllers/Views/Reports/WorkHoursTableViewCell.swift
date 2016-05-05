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
            balance.textColor = UIColor(red:1.00, green:0.29, blue:0.40, alpha:1.00)
        } else {
            balance.textColor = UIColor(red:0.28, green:0.86, blue:0.42, alpha:1.00)
            balance.text = "+" + balance.text!
        }
    }

}
