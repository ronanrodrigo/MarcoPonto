import UIKit
import MarcoPontoCore

class PunchTypeLabel: UILabel {

    override func awakeFromNib() {
        layer.cornerRadius = 3.0
        clipsToBounds = true
        textColor = UIColor.whiteColor()
    }

    func background(by type: PunchType) {
        if type == .Output {
            backgroundColor = UIColor.lilac
        } else {
            backgroundColor = UIColor.primary
        }
    }
}
