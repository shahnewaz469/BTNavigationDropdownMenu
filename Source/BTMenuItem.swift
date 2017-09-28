//
//  BTMenuItem.swift
//  Demo
//
//  Created by Shah Newaz Hossain on 28/9/17.
//  Copyright © 2017 PHAM BA THO. All rights reserved.
//

import UIKit

open class BTMenuItem: NSObject {
    
    var value: Int
    var title: String
    
    init(title: String, value: Int) {
        self.title = title
        self.value = value
    }
    
}
