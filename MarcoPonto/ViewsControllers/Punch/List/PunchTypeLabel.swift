import UIKit

class PunchTypeLabel: UILabel {

    override func awakeFromNib() {
        layer.cornerRadius = 3.0
        clipsToBounds = true
        textColor = UIColor.whiteColor()
    }

    func background(by type: PunchType) {
        if type == .Output {
            backgroundColor = UIColor(red:0.61, green:0.15, blue:0.69, alpha:1.00)
        } else {
            backgroundColor = UIColor(red:0.91, green:0.11, blue:0.38, alpha:1.00)
        }
    }
}
