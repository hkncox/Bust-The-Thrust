//
//  LearnMoreExpandingCell.swift
//  Bust the Thrust App
//
//  Created by Nicole Talley on 12/6/15.
//  Copyright © 2015 Nicole Talley. All rights reserved.
//


import UIKit

class LearnMoreExpandingCell : UITableViewCell{
    @IBOutlet weak var WhatIsTongueThrust: UILabel!
    @IBOutlet weak var WhatIsTT: UILabel!
    class var expandedHeight: CGFloat { get {return 200}}
    class var defaultHeight :CGFloat {get { return 44}}
    func checkHeight(){
        WhatIsTT.hidden = (frame.size.height < LearnMoreExpandingCell.expandedHeight)
    }
    func watchFrameChanges(){
        addObserver(self, forKeyPath: "frame", options: .New, context:nil)
        checkHeight()
    }
    func ignoreFrameChanges(){
        removeObserver(self, forKeyPath: "frame")
    }
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "frame"{checkHeight()}
    }
}