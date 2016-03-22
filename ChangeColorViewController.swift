//
//  ChangeColorViewController.swift
//  Example
//
//  Created by Elina Samardjieva on 3/22/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

class ChangeColorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let negativeSpace = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        negativeSpace.width = -12
        
        let editButton = UIButton(type: .Custom)
        editButton.frame = CGRectMake(0, 0, 60, 30)
        editButton.setTitle("Add", forState: .Normal)
        editButton.addTarget(self, action: "addColor", forControlEvents: .TouchUpInside)
        editButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        let editItem = UIBarButtonItem(customView: editButton)
        
        navigationItem.rightBarButtonItems = [negativeSpace, editItem]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func addColor() {
//                ViewController().dataArray.append(Color(name: "yellow", color: UIColor.yellowColor()))
//                print("Color added")
//        
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    //reload your tableView
//                    ViewController().self.tableView.reloadData()
//                })
//    }
}
