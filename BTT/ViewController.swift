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
        cell.WhatIsTT.text = "A tongue thrust, otherwise known as an orofacial myofunctional disorder, occurs when the tongue moves forward in an exaggerated way during speech and/or swallowing. The tongue may lie too far forward during rest or may protrude between the upper and lower teeth during speech and swallowing, and at rest. A person typically swallows between 1,200 and 2,000 times within a 24 hour time period with about four pounds of pressure each time. If a person suffers from a tongue thrust, this continuous pressure tends to force the teeth out of alignment. Many orthodontists complete orthodontic treatment with what appears to be good results, only to discover that the case relapses because of the patient's tongue thrust. If the tongue is allowed to continue its pushing action against the teeth, it will continue to push the teeth forward and reverse any orthodontic work performed."
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
