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
    
    var dataArray = [Color(name: "green", color: UIColor.greenColor()), Color(name: "red", color: UIColor.redColor()), Color(name: "blue", color: UIColor.blueColor())]
    
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
  
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! CustomTableViewCell
        
        if indexPath.row < dataArray.count {
            let color = dataArray[indexPath.row]
            
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
        
        if indexPath.row < dataArray.count {
            let color = dataArray[indexPath.row]
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ColorViewController") as! ColorViewController
            
            vc.color = color
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: - Delete cell
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        switch editingStyle {
            case .Delete:
                
                dataArray.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            default:
                return
            }
    }
    
    // MARK: - Move cell

    func startEditing() {
        self.tableView.editing = true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        var itemToMove = dataArray[fromIndexPath.row]
        dataArray.removeAtIndex(fromIndexPath.row)
        dataArray.insert(itemToMove, atIndex: toIndexPath.row)
    }
    
    // MARK: - Add footer
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
        footerView.backgroundColor = UIColor.grayColor()
        
        let dunamicButton = UIButton(type: .Custom)
        dunamicButton.backgroundColor = UIColor.blackColor()
        dunamicButton.setTitle("Button", forState: UIControlState.Normal)
        dunamicButton.frame = CGRectMake(0, 0, 100, 40)
        dunamicButton.addTarget(self, action: "buttonTouched", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        // Add refresh button
//        
//        let refreshButton = UIButton(type: .Custom)
//        refreshButton.backgroundColor = UIColor.blackColor()
//        refreshButton.setTitle("Refresh", forState: UIControlState.Normal)
//        refreshButton.frame = CGRectMake(150, 0, 100, 40)
//        refreshButton.addTarget(self, action: "refreshButtonTouched", forControlEvents: UIControlEvents.TouchUpInside)
//        
        
        
        footerView.addSubview(dunamicButton)
 //       footerView.addSubview(refreshButton)
        
        return footerView
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40.0
    }
    
//    func buttonTouched() {
//        let vcColor = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ChangeColorViewController") as! ChangeColorViewController
//        navigationController?.pushViewController(vcColor, animated: true)
//    }
    
    func buttonTouched() {
        dataArray.append(Color(name: "yellow", color: UIColor.yellowColor()))
        print("Color added")

        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            //reload your tableView
            self.tableView.reloadData()
        })
    }
    
        func refreshButtonTouched() {
    
                self.tableView.reloadData()
        }
}
