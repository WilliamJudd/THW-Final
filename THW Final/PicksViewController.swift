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
    
    var timer: Timer!
//    var recordRef: Firebase!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
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
        
        timer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(PicksViewController.alerter), userInfo: nil, repeats: false)
        
    }
    
    func alerter(){
        
        SweetAlert().showAlert("Sweet!", subTitle: "Now pick your three favorite flavors.", style: AlertStyle.customImag(imageFile: "thumbsUp.jpg"), buttonTitle: "Ok")
        timer.invalidate()
        
    }
    
    
    @IBAction func teamProgressButtonTapped(_ sender: UIButton!) {
        
        greatn.setImage(UIImage(named: "GNW"), for: UIControlState())
        greatn.setImage(UIImage(named: "GNB"), for: .selected)
        
        whitek.setImage(UIImage(named: "WKGW"), for: UIControlState())
        whitek.setImage(UIImage(named: "WKGB"), for: .selected)
        
        redMusc.setImage(UIImage(named: "MRMW"), for: UIControlState())
        redMusc.setImage(UIImage(named: "MRMB"), for: .selected)
        
        whiteMusc.setImage(UIImage(named: "MWMW"), for: UIControlState())
        whiteMusc.setImage(UIImage(named: "MWMB"), for: .selected)
        
        blueberry.setImage(UIImage(named: "BBW"), for: UIControlState())
        blueberry.setImage(UIImage(named: "BBB"), for: .selected)
        
        fineBlack.setImage(UIImage(named: "FBW"), for: UIControlState())
        fineBlack.setImage(UIImage(named: "FBB"), for: .selected)
        
        properP.setImage(UIImage(named: "PPW"), for: UIControlState())
        properP.setImage(UIImage(named: "PPB"), for: .selected)
        
        apple.setImage(UIImage(named: "AW"), for: UIControlState())
        apple.setImage(UIImage(named: "AB"), for: .selected)
        
        straw.setImage(UIImage(named: "SSW"), for: UIControlState())
        straw.setImage(UIImage(named: "SSB"), for: .selected)
        
        if sender == sender {
            
            sender.isSelected = !sender.isSelected
            
            if sender.state.rawValue == 5  {
                
                wines.add((sender.titleLabel?.text)!)
                wines2.add(sender.image(for: .selected)!)
                (sender.image(for: .selected)!)
            }else{
                wines.remove((sender.titleLabel?.text)!)
                wines2.remove(sender.image(for: .selected)!)
                
                (sender.image(for: .selected)!)
            }
        }
        
        
//        let picksRef = recordRef.childByAppendingPath("wines")
        
//        let WinePicks = wines
        
//        picksRef.updateChildValues(["three wines" : WinePicks])
        
        if wines.count == (3){
            
            SweetAlert().showAlert("Good job!", subTitle: "Claim your prize!", style: AlertStyle.success, buttonTitle: "Ok", buttonColor:UIColor.colorFromRGB(0xD0D0D0)){ (isOtherButton) -> Void in
                
                if isOtherButton == true {
                    
                    self.lastPage()
                    
                }else{
                    
                }
            }
            
        }
    }
    func lastPage(){
        
        performSegue(withIdentifier: "thanks", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "thanks" {
            let thanksViewController = segue.destination as! TYViewController
//            thanksViewController.recordRef = recordRef
            thanksViewController.wines = wines
            thanksViewController.wines = wines2
            
            
        }
    }
    
    
}
