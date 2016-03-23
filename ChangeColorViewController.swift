//
//  ChangeColorViewController.swift
//  Example
//
//  Created by Elina Samardjieva on 3/22/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class ChangeColorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var addColorTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addColorTableView.registerNib(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        let negativeSpace = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        negativeSpace.width = -12
        
        let editButton = UIButton(type: .Custom)
        editButton.frame = CGRectMake(0, 0, 60, 30)
        editButton.setTitle("Add", forState: .Normal)
        editButton.addTarget(self, action: "addNewColor", forControlEvents: .TouchUpInside)
        editButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        let editItem = UIBarButtonItem(customView: editButton)
        
        navigationItem.rightBarButtonItems = [negativeSpace, editItem]
    }
    
        // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.sharedManager.possibleColor.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! CustomTableViewCell
        
        if indexPath.row < DataManager.sharedManager.possibleColor.count {
            let color = DataManager.sharedManager.possibleColor[indexPath.row]
            
            cell.titleLabel.text = color.name
            cell.colorView.backgroundColor = color.color
        }
        
        cell.selectionStyle = .None
        return cell
    }
    
    // MARK: - Add new color
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row < DataManager.sharedManager.possibleColor.count {
            let color = DataManager.sharedManager.possibleColor[indexPath.row]
            DataManager.sharedManager.addColor(color)

        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
}
