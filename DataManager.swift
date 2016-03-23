//
//  DataManager.swift
//  Example
//
//  Created by Elina Samardjieva on 3/23/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

private let _sharedInstance = DataManager()

class DataManager: NSObject {

    var dataArray = [Color(name: "green", color: UIColor.greenColor()), Color(name: "red", color: UIColor.redColor()), Color(name: "blue", color: UIColor.blueColor())]
    
    var possibleColor = [Color(name: "purple", color: UIColor.purpleColor()), Color(name: "gray", color: UIColor.grayColor()), Color(name: "yellow", color: UIColor.yellowColor())]
    
    func addColor(color: Color) {
        dataArray.append(color)
    }
    
    func removeColor(removeColor: Int) {
        dataArray.removeAtIndex(removeColor)
    }
    
    class var sharedManager: DataManager {
        return _sharedInstance
    }
}