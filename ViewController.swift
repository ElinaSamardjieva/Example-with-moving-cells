//
//  ViewController.swift
//  Example
//
//  Created by Dea on 3/21/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    let footerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerNib(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        // Navigation bar button
        
        let negativeSpace = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        negativeSpace.width = -12
        
        let editButton = UIButton(type: .Custom)
        editButton.frame = CGRectMake(0, 0, 60, 30)
        editButton.setTitle("Edit", forState: .Normal)
        editButton.addTarget(self, action: "startEditing", forControlEvents: .TouchUpInside)
        editButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        let editItem = UIBarButtonItem(customView: editButton)
        
        navigationItem.rightBarButtonItems = [negativeSpace, editItem]
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
  
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.sharedManager.dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! CustomTableViewCell
        
        if indexPath.row < DataManager.sharedManager.dataArray.count {
            let color = DataManager.sharedManager.dataArray[indexPath.row]
            
            cell.titleLabel.text = color.name
            cell.colorView.backgroundColor = color.color
        }
        
        cell.selectionStyle = .None
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row < DataManager.sharedManager.dataArray.count {
            let color = DataManager.sharedManager.dataArray[indexPath.row]
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ColorViewController") as! ColorViewController
            
            vc.color = color
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: - Delete cell
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        switch editingStyle {
            case .Delete:
                
                var remove = indexPath.row
                DataManager.sharedManager.removeColor(remove)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
                
//                DataManager.sharedManager.dataArray.removeAtIndex(indexPath.row)
//                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            default:
                return
            }
    }
    
    // MARK: - Move cell

    func startEditing() {
        self.tableView.editing = true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        var itemToMove = DataManager.sharedManager.dataArray[fromIndexPath.row]
        DataManager.sharedManager.dataArray.removeAtIndex(fromIndexPath.row)
        DataManager.sharedManager.dataArray.insert(itemToMove, atIndex: toIndexPath.row)
    }
    
    // MARK: - Add footer
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
        footerView.backgroundColor = UIColor.grayColor()
        
        let dunamicButton = UIButton(type: .Custom)
        dunamicButton.backgroundColor = UIColor.blackColor()
        dunamicButton.setTitle("Add color", forState: UIControlState.Normal)
        dunamicButton.frame = CGRectMake(0, 0, 100, 40)
        dunamicButton.addTarget(self, action: "seePossibleColors", forControlEvents: UIControlEvents.TouchUpInside)

        
        footerView.addSubview(dunamicButton)
        
        return footerView
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func seePossibleColors() {
        print(DataManager.sharedManager.dataArray.count)
        let vcColor = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ChangeColorViewController") as! ChangeColorViewController
        navigationController?.pushViewController(vcColor, animated: true)
    }
}
