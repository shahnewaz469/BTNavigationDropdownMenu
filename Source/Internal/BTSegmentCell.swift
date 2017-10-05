//
//  BTSegmentCell.swift
//  Demo
//
//  Created by Shah Newaz Hossain on 5/10/17.
//  Copyright © 2017 PHAM BA THO. All rights reserved.
//

import UIKit

class BTSegmentCell: UITableViewCell {

    var configuration: BTConfiguration? {
        didSet {
            if let configuration = configuration {
                // Setup cell
                self.backgroundColor = configuration.cellBackgroundColor
                self.selectionStyle = UITableViewCellSelectionStyle.none
                self.segmentedControl.tintColor = configuration.cellTextLabelColor

            }
            
        }
    }
    
    var segmentedControl: UISegmentedControl!
    var selectSegmentIndexPathHandler: ((_ index: Int) -> ())?

    init(style: UITableViewCellStyle, reuseIdentifier: String?, segments: [String], selectedSegment: Int) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.segmentedControl = UISegmentedControl(items: segments)
        self.segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.segmentedControl)
        self.segmentedControl.selectedSegmentIndex = selectedSegment
        self.segmentedControl.addTarget(self, action: #selector(typeChanged(_:)), for: .valueChanged)
        let horizontalConstraint = NSLayoutConstraint(item: self.segmentedControl, attribute: .centerX, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: .centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: self.segmentedControl, attribute: .centerY, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: self.segmentedControl, attribute: .leading, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 14)
        let trailingConstraint = NSLayoutConstraint(item: self.segmentedControl, attribute: .trailing, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: -14)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, leadingConstraint, trailingConstraint])

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func typeChanged(_ sender: UISegmentedControl) {
        if let handler = self.selectSegmentIndexPathHandler {
            handler(self.segmentedControl.selectedSegmentIndex)
        }
    }
    
}
