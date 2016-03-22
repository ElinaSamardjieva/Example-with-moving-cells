//
//  CustomTableViewCell.swift
//  Example
//
//  Created by Dea on 3/21/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var colorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        colorView.layer.cornerRadius = CGRectGetHeight(colorView.bounds)/2.0
    }
    
}
