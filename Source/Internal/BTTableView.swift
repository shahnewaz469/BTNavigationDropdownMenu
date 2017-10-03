//
//  BTTableView.swift
//
//  Copyright (c) 2017 PHAM BA THO (phambatho@gmail.com). All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

class BTTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    // Public properties
    var configuration: BTConfiguration!
    var selectRowAtIndexPathHandler: ((_ indexPath: Int) -> ())?
    
    // Private properties
    var items: [BTMenuItem] = []
    var selectedIndexPath: Int?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, items: [BTMenuItem], selectedIndex: Int, configuration: BTConfiguration) {
        super.init(frame: frame, style: UITableViewStyle.plain)
        
        self.items = items
        self.selectedIndexPath = selectedIndex
        self.configuration = configuration
        
        // Setup table view
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.clear
        if configuration.shouldShowSeperator {
            self.separatorStyle = .singleLine
        } else {
            self.separatorStyle = .none
        }
        self.separatorEffect = UIBlurEffect(style: .light)
        self.autoresizingMask = UIViewAutoresizing.flexibleWidth
        self.tableFooterView = UIView(frame: CGRect.zero)
        self.isScrollEnabled = configuration.shouldScrollEnabled
        self.separatorColor = configuration.cellSeparatorColor
        self.separatorInset = UIEdgeInsets.zero
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.configuration.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BTMenuCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell", configuration: self.configuration)
        cell.configuration = self.configuration
        cell.textLabel?.text = self.items[indexPath.row].title
        cell.countLabel?.text = "\(self.items[indexPath.row].value)"
        if indexPath.row == selectedIndexPath {
            cell.selectionLabel.isHidden = false
            cell.countLabel.backgroundColor = self.configuration.cellSelectionColor
            cell.textLabel?.textColor = self.configuration.selectedCellTextLabelColor
            cell.countLabel?.textColor = self.configuration.selectedCellTextLabelColor

        } else {
            cell.selectionLabel.isHidden = true
            cell.countLabel.backgroundColor = UIColor.lightGray
            cell.textLabel?.textColor = self.configuration.cellTextLabelColor
            cell.countLabel?.textColor = self.configuration.cellTextLabelColor

        }
        return cell
    }
    
    // Table view delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath.row
        self.selectRowAtIndexPathHandler!(indexPath.row)
        self.reloadData()

    }

}
