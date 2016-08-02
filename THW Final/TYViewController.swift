//
//  TYViewController.swift
//  THW Final
//
//  Created by William Judd on 4/1/16.
//  Copyright © 2016 William Judd. All rights reserved.
//

import UIKit
import Firebase

class TYViewController: UIViewController {
    
    var timer: NSTimer!
//    var recordRef: Firebase!
    var wines : NSMutableArray = NSMutableArray()
    var wines2 : NSMutableArray = NSMutableArray()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(8.0, target: self, selector: #selector(TYViewController.timeToMoveOn), userInfo: nil, repeats: false)
        
        // Do any additional setup after loading the view.
    }
    
    
    func timeToMoveOn() {
        self.performSegueWithIdentifier("unwind4", sender: self)
        timer.invalidate()
    }
    
}
