//
//  ViewController.swift
//  Bust the Thrust App
//
//  Created by Nicole Talley on 12/6/15.
//  Copyright © 2015 Nicole Talley. All rights reserved.
//

import UIKit
let cellID = "cell"
class ViewController: UITableViewController {
    var selectedIndexPath: NSIndexPath?
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return 2}
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath :indexPath) as! LearnMoreExpandingCell
        cell.WhatIsTongueThrust.text = "What Is Tongue Thrust?"
        cell.WhatIsTT.text = "texetextetxtetxtetx"
        return cell
    }
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let previousIndexPath = selectedIndexPath
        if indexPath == selectedIndexPath  {
            selectedIndexPath = nil
        }
        else{
            selectedIndexPath = indexPath
        }
        var indexPaths: Array<NSIndexPath> = []
        if let previous = previousIndexPath {
            indexPaths += [previous]
            
        }
        if let current = selectedIndexPath{
            indexPaths += [current]
        }
        if indexPaths.count > 0{
            tableView.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        
    }
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! LearnMoreExpandingCell).watchFrameChanges()
    }
    override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! LearnMoreExpandingCell).ignoreFrameChanges()
    }
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
