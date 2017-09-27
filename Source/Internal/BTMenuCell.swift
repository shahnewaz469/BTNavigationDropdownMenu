//
//  BTMenuCell.swift
//  Demo
//
//  Created by Shah Newaz Hossain on 27/9/17.
//  Copyright © 2017 PHAM BA THO. All rights reserved.
//

import UIKit

class BTMenuCell: UITableViewCell {
    
    @IBOutlet weak var selectionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var configuration: BTConfiguration? {
        didSet {
            if let configuration = configuration {
                // Setup cell
                self.backgroundColor = configuration.cellBackgroundColor
                self.selectionStyle = UITableViewCellSelectionStyle.none
                self.titleLabel!.textColor = configuration.cellTextLabelColor
                self.titleLabel!.font = configuration.cellTextLabelFont
                self.titleLabel!.textAlignment = configuration.cellTextLabelAlignment
                
                self.countLabel!.font = configuration.cellTextLabelFont

                self.selectionLabel.isHidden = true
                self.selectionLabel.backgroundColor = configuration.cellSelectionColor
                

            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countLabel.layer.masksToBounds = true
        countLabel.layer.cornerRadius = 12.0
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: true)
//        self.selectionLabel.isHidden = !selected
//    }
}
