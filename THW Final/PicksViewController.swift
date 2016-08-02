//
//  PicksViewController.swift
//  THW Final
//
//  Created by William Judd on 4/1/16.
//  Copyright © 2016 William Judd. All rights reserved.
//

import UIKit
import Foundation
import AssetsLibrary
import MessageUI
import AVFoundation
//import Firebase

class PicksViewController: UIViewController {
    
    var timer: NSTimer!
//    var recordRef: Firebase!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    
    @IBOutlet weak var greatn: UIButton!
    @IBOutlet weak var whitek: UIButton!
    @IBOutlet weak var redMusc: UIButton!
    @IBOutlet weak var whiteMusc: UIButton!
    @IBOutlet weak var blueberry: UIButton!
    @IBOutlet weak var fineBlack: UIButton!
    @IBOutlet weak var properP: UIButton!
    @IBOutlet weak var apple: UIButton!
    @IBOutlet weak var straw: UIButton!
    
    var wines: NSMutableArray = NSMutableArray()
    var wines2: NSMutableArray = NSMutableArray()
    
    var overlayView: UIView!
    var tyalert: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.6, target: self, selector: #selector(PicksViewController.alerter), userInfo: nil, repeats: false)
        
    }
    
    func alerter(){
        
        SweetAlert().showAlert("Sweet!", subTitle: "Now pick your three favorite flavors.", style: AlertStyle.CustomImag(imageFile: "thumbsUp.jpg"), buttonTitle: "Ok")
        timer.invalidate()
        
    }
    
    
    @IBAction func teamProgressButtonTapped(sender: UIButton!) {
        
        greatn.setImage(UIImage(named: "GNW"), forState: .Normal)
        greatn.setImage(UIImage(named: "GNB"), forState: .Selected)
        
        whitek.setImage(UIImage(named: "WKGW"), forState: .Normal)
        whitek.setImage(UIImage(named: "WKGB"), forState: .Selected)
        
        redMusc.setImage(UIImage(named: "MRMW"), forState: .Normal)
        redMusc.setImage(UIImage(named: "MRMB"), forState: .Selected)
        
        whiteMusc.setImage(UIImage(named: "MWMW"), forState: .Normal)
        whiteMusc.setImage(UIImage(named: "MWMB"), forState: .Selected)
        
        blueberry.setImage(UIImage(named: "BBW"), forState: .Normal)
        blueberry.setImage(UIImage(named: "BBB"), forState: .Selected)
        
        fineBlack.setImage(UIImage(named: "FBW"), forState: .Normal)
        fineBlack.setImage(UIImage(named: "FBB"), forState: .Selected)
        
        properP.setImage(UIImage(named: "PPW"), forState: .Normal)
        properP.setImage(UIImage(named: "PPB"), forState: .Selected)
        
        apple.setImage(UIImage(named: "AW"), forState: .Normal)
        apple.setImage(UIImage(named: "AB"), forState: .Selected)
        
        straw.setImage(UIImage(named: "SSW"), forState: .Normal)
        straw.setImage(UIImage(named: "SSB"), forState: .Selected)
        
        if sender == sender {
            
            sender.selected = !sender.selected
            
            if sender.state.rawValue == 5  {
                
                wines.addObject((sender.titleLabel?.text)!)
                wines2.addObject(sender.imageForState(.Selected)!)
                (sender.imageForState(.Selected)!)
            }else{
                wines.removeObject((sender.titleLabel?.text)!)
                wines2.removeObject(sender.imageForState(.Selected)!)
                
                (sender.imageForState(.Selected)!)
            }
        }
        
        
//        let picksRef = recordRef.childByAppendingPath("wines")
        
//        let WinePicks = wines
        
//        picksRef.updateChildValues(["three wines" : WinePicks])
        
        if wines.count == (3){
            
            SweetAlert().showAlert("Good job!", subTitle: "Claim your prize!", style: AlertStyle.Success, buttonTitle: "Ok", buttonColor:UIColor.colorFromRGB(0xD0D0D0)){ (isOtherButton) -> Void in
                
                if isOtherButton == true {
                    
                    self.lastPage()
                    
                }else{
                    
                }
            }
            
        }
    }
    func lastPage(){
        
        performSegueWithIdentifier("thanks", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "thanks" {
            let thanksViewController = segue.destinationViewController as! TYViewController
//            thanksViewController.recordRef = recordRef
            thanksViewController.wines = wines
            thanksViewController.wines = wines2
            
            
        }
    }
    
    
}
