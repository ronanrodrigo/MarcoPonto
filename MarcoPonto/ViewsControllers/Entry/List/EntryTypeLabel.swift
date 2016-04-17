//
//  EntryTypeLabel.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

class EntryTypeLabel: UILabel {

    override func awakeFromNib() {
        layer.cornerRadius = 3.0
        clipsToBounds = true
        textColor = UIColor.whiteColor()
    }

    func paintBackground(type: EntryType) {
        if type == .Output {
            backgroundColor = UIColor(red:0.61, green:0.15, blue:0.69, alpha:1.00)
        } else {
            backgroundColor = UIColor(red:0.91, green:0.11, blue:0.38, alpha:1.00)
        }
    }
}
