//
//  ColorViewController.swift
//  Example
//
//  Created by Elina on 3/21/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    var color: Color?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let color = color {
            view.backgroundColor = color.color
        }
    }
}
