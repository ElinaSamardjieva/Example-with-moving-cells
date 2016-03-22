//
//  Color.swift
//  Example
//
//  Created by Elina on 3/21/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class Color: NSObject {

    var name = ""
    var color = UIColor()
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
    
}
