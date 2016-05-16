import UIKit

class FacebookTableViewCell: UITableViewCell {

    @IBOutlet weak var facebookSignButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func didTappedAtFacebookSign(sender: AnyObject) {
        print("shu")
    }
}
