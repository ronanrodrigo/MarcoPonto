//
//  ListEntriesTableViewCell.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class ListEntriesTableViewCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var type: EntryTypeLabel!
    
    let dateFormatter = NSDateFormatter()
    let timeFormatter = NSDateFormatter()
    let gray = UIColor(red: 0.752, green: 0.752, blue: 0.752, alpha: 0.9)
    var entry: Entry?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        dateFormatter.dateFormat = "dd/MM/YY - EEEE"
        timeFormatter.dateFormat = "HH:mm"
    }
    
    func updateCell(entry: Entry) {
        date.text = dateFormatter.stringFromDate(entry.moment)
        hour.text = timeFormatter.stringFromDate(entry.moment)
        type.text = entry.type.description()
        type.background(by: entry.type)
        self.entry = entry
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        type.textColor = highlighted ? gray :  UIColor.whiteColor()
        super.setHighlighted(highlighted, animated: animated)
    }
}
