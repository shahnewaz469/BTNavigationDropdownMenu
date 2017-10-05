//
//  BTMenuCell.swift
//  Demo
//
//  Created by Shah Newaz Hossain on 27/9/17.
//  Copyright © 2017 PHAM BA THO. All rights reserved.
//

import UIKit

class BTMenuCell: UITableViewCell {

    var selectionLabel: UILabel!
    var countLabel: UILabel!
    var configuration: BTConfiguration? {
        didSet {
            if let configuration = configuration {
                // Setup cell
                self.backgroundColor = configuration.cellBackgroundColor
                self.selectionStyle = UITableViewCellSelectionStyle.none
                self.textLabel?.textColor = configuration.cellTextLabelColor
                self.textLabel?.font = configuration.cellTextLabelFont
                self.textLabel?.textAlignment = configuration.cellTextLabelAlignment
                self.countLabel.font = configuration.cellTextLabelFont.withSize(configuration.cellTextLabelFont.pointSize - 1.0)
                self.selectionLabel.isHidden = true
                self.selectionLabel.backgroundColor = configuration.cellSelectionColor

            }
        }
    }
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, configuration: BTConfiguration) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionLabel = UILabel()
        self.selectionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.selectionLabel)
        let verticalConstraint = NSLayoutConstraint(item: self.selectionLabel, attribute: .centerY, relatedBy: NSLayoutRelation.equal, toItem: self.textLabel, attribute: .centerY, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: self.selectionLabel, attribute: .width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 5)
        let heightConstraint = NSLayoutConstraint(item: self.selectionLabel, attribute: .height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        
        self.countLabel = UILabel()
        self.countLabel.textAlignment = .center
        self.countLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.countLabel)
        self.countLabel.layer.masksToBounds = true
        self.countLabel.layer.cornerRadius = 10.0
        self.countLabel.padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)

        let verticalConstraint2 = NSLayoutConstraint(item: self.countLabel, attribute: .centerY, relatedBy: .equal, toItem: self.textLabel, attribute: .centerY, multiplier: 1, constant: 0)
        let widthConstraint2 = NSLayoutConstraint(item: self.countLabel, attribute: .width, relatedBy: NSLayoutRelation.greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44)
        let heightConstraint2 = NSLayoutConstraint(item: self.countLabel, attribute: .height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 22)
        let trailingConstraint2 = NSLayoutConstraint(item: self.countLabel, attribute: .trailing, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: -14)

        NSLayoutConstraint.activate([verticalConstraint, verticalConstraint, widthConstraint, heightConstraint, verticalConstraint2, verticalConstraint2, widthConstraint2, heightConstraint2, trailingConstraint2])

        self.configuration = configuration
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
