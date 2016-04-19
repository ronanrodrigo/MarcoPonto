//
//  SelectTypeTableViewCell.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import UIKit

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
