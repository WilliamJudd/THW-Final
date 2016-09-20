//
//  SplashViewController.swift
//  THW Final
//
//  Created by William Judd on 4/1/16.
//  Copyright © 2016 William Judd. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    var timer: Timer!
    
    @IBOutlet weak var land1: UIImageView!
    @IBOutlet weak var land2: UIImageView!
    @IBOutlet weak var land3: UIImageView!
    @IBOutlet weak var land4: UIImageView!
    @IBOutlet weak var land5: UIImageView!
    @IBOutlet weak var land6: UIImageView!
    @IBOutlet weak var land7: UIImageView!
    @IBOutlet weak var land8: UIImageView!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bubble = [self.registerButton]
        
        for bt in bubble {
            let pathAnimation = CAKeyframeAnimation(keyPath: "position")
            pathAnimation.calculationMode = kCAAnimationPaced
            pathAnimation.fillMode = kCAFillModeForwards
            pathAnimation.isRemovedOnCompletion = false
            pathAnimation.repeatCount = Float.infinity
            pathAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            
            if (bt == self.registerButton) {
                pathAnimation.duration = 20
            }
            
            let curvedPath = CGMutablePath()
            let circleContainer = bt?.frame.insetBy(dx: -80,dy: -80)
//            CGPathAddEllipseInRect(curvedPath, circleContainer)
            pathAnimation.path = curvedPath
            bt?.layer.add(pathAnimation, forKey: "myCircleAnimation")
            
            
            let scaleX = CAKeyframeAnimation(keyPath:"transform.scale.x")
            scaleX.values   =  [1.0, 1.1, 1.0]
            scaleX.keyTimes =  [0.0, 0.5,1.0]
            scaleX.repeatCount = Float.infinity
            scaleX.autoreverses = true
            scaleX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            if (bt == self.registerButton) {
                scaleX.duration = 3
            }
            
            bt?.layer.add(scaleX, forKey: "scaleXAnimation")
            
            let scaleY = CAKeyframeAnimation(keyPath:"transform.scale.y")
            scaleY.values = [1.0, 1.1, 1.0]
            scaleY.keyTimes = [0.0, 0.5,1.0]
            scaleY.repeatCount = Float.infinity
            scaleY.autoreverses = true
            scaleX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            if (bt == self.registerButton) {
                scaleY.duration = 3
            }
            
            bt?.layer.add(scaleY, forKey: "scaleYAnimation")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        land1.alpha = 1
        land2.alpha = 0
        land3.alpha = 0
        land4.alpha = 0
        land5.alpha = 0
        land6.alpha = 0
        land7.alpha = 0
        land8.alpha = 0
        self.perform(#selector(SplashViewController.One), with: nil, afterDelay: 2.0)
    }
    
    func One(){
        
        land1.alpha = 1
        land2.alpha = 0
        UIView.animate(withDuration: 3, delay: 5, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.land1.alpha = 0
            self.land2.alpha = 1
            
        }) { (Bool) -> Void in
            self.perform(#selector(SplashViewController.Two), with: nil)
        }
    }
    
    func Two(){
        land2.alpha = 1
        land3.alpha = 0
        UIView.animate(withDuration: 3, delay: 5, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.land2.alpha = 0
            self.land3.alpha = 1
            
        }) { (Bool) -> Void in
            self.perform(#selector(SplashViewController.Three), with: nil)
        }
    }
    
    func Three(){
        
        land3.alpha = 1
        land4.alpha = 0
        UIView.animate(withDuration: 3, delay: 5, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.land3.alpha = 0
            self.land4.alpha = 1
            
        }) { (Bool) -> Void in
            
            self.perform(#selector(SplashViewController.Four), with: nil)
            
        }
    }
    
    func Four(){
        
        land4.alpha = 1
        land5.alpha = 0
        UIView.animate(withDuration: 3, delay: 5, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.land4.alpha = 0
            self.land5.alpha = 1
            
        }) { (Bool) -> Void in
            self.perform(#selector(SplashViewController.Five), with: nil)
        }
    }
    
    func Five(){
        land5.alpha = 1
        land6.alpha = 0
        UIView.animate(withDuration: 3, delay: 5, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.land5.alpha = 0
            self.land6.alpha = 1
            
        }) { (Bool) -> Void in
            self.perform(#selector(SplashViewController.Six), with: nil)
        }
    }
    
    func Six(){
        
        land6.alpha = 1
        land7.alpha = 0
        UIView.animate(withDuration: 3, delay: 5, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.land6.alpha = 0
            self.land7.alpha = 1
            
        }) { (Bool) -> Void in
            self.perform(#selector(SplashViewController.Seven), with: nil)
        }
    }
    
    func Seven(){
        
        land7.alpha = 1
        land8.alpha = 0
        UIView.animate(withDuration: 3, delay: 5, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.land7.alpha = 0
            self.land8.alpha = 1
            
        }) { (Bool) -> Void in
            self.perform(#selector(SplashViewController.Eight), with: nil)
        }
    }
    
    func Eight(){
        
        land8.alpha = 1
        land1.alpha = 0
        UIView.animate(withDuration: 3, delay: 5, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.land8.alpha = 0
            self.land1.alpha = 1
            
        }) { (Bool) -> Void in
            
        }
    }
    
    @IBAction func unwindToContainerVC(_ segue: UIStoryboardSegue) {
        
    }
    
    
    @IBAction func asfasdf(_ sender: AnyObject) {
        
        //BUTTON IS INVISABLE//
        performSegue(withIdentifier: "signUp", sender: nil)
        
    }
    
}
