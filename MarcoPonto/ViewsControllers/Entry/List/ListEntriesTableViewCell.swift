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
    @IBOutlet weak var type: UILabel!
    
    let dateFormatter = NSDateFormatter()
    let timeFormatter = NSDateFormatter()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        dateFormatter.locale = NSLocale(localeIdentifier: "pt_BR")
        timeFormatter.locale = NSLocale(localeIdentifier: "pt_BR")
        
        dateFormatter.dateStyle = .FullStyle
        dateFormatter.timeStyle = .NoStyle
        
        timeFormatter.timeStyle = .MediumStyle
        timeFormatter.dateStyle = .NoStyle
    }
    
    func updateCell(entry: Entry) {
        date.text = dateFormatter.stringFromDate(entry.moment)
        hour.text = timeFormatter.stringFromDate(entry.moment)
        type.text = entry.type.description()
    }
}
