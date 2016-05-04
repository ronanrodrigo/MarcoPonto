import UIKit
import MarcoPontoCore

class ListPunchsTableViewCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var type: PunchTypeLabel!

    private let dateFormatter = NSDateFormatter()
    private let timeFormatter = NSDateFormatter()
    private let gray = UIColor(red: 0.752, green: 0.752, blue: 0.752, alpha: 0.9)
    var punch: Punch?

    override func awakeFromNib() {
        super.awakeFromNib()

        dateFormatter.dateFormat = "dd/MM/YY - EEEE"
        timeFormatter.dateFormat = "HH:mm"
    }

    func updateCell(punch: Punch) {
        date.text = dateFormatter.stringFromDate(punch.moment)
        hour.text = timeFormatter.stringFromDate(punch.moment)
        type.text = punch.type.title
        type.background(by: punch.type)
        self.punch = punch
    }

    override func setHighlighted(highlighted: Bool, animated: Bool) {
        type.textColor = highlighted ? gray :  UIColor.whiteColor()
        super.setHighlighted(highlighted, animated: animated)
    }
}
