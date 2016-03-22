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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerNib(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        //let mySelector: Selector = "testPrint"
        let mySelector: Selector = "startEditing"
        
                var barButtonItem = UIBarButtonItem(
                    title: "Edit",
                    style: .Plain,
                    target: self,
                    action: mySelector)

        self.navigationItem.rightBarButtonItem = barButtonItem
        
        
        // MARK: - BarButtonItem (Edit -> Done)
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    func testPrint() {
        print("Test")
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
    
    func tableView(tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath) {
            switch editingStyle {
            case .Delete:
                
                dataArray.removeAtIndex(indexPath.row)
                
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
                
            default:
                return
            }
    }
    
    // MARK: - Move cell
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func startEditing() {
        self.tableView.editing = true
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true}
    
    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        var itemToMove = dataArray[fromIndexPath.row]
        dataArray.removeAtIndex(fromIndexPath.row)
        dataArray.insert(itemToMove, atIndex: toIndexPath.row)
    }
    
}

