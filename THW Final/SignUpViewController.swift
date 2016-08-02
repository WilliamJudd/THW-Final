//
//  SignUpViewController.swift
//  THW Final
//
//  Created by William Judd on 4/1/16.
//  Copyright © 2016 William Judd. All rights reserved.
//

import UIKit
import CoreLocation
//import Firebase
import DropDown


class SignUpViewController: UIViewController {
    
    
    let APP_ID = "B120C130-9094-0A65-FF60-85F60ED73700"
    let SECRET_KEY = "3FF94249-8318-1FF9-FFF8-EB47BC5CA700"
    let VERSION_NUM = "v1"
//    var recordRef: Firebase!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var listId: String!
    var backendless = Backendless.sharedInstance()
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var birthdateTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var deviceID: UILabel!
    @IBOutlet weak var firstNameCheck: UIImageView!
    @IBOutlet weak var lastNameCheck: UIImageView!
    @IBOutlet weak var emailCheck: UIImageView!
    @IBOutlet weak var stateCheck: UIImageView!
    @IBOutlet weak var cityCheck: UIImageView!
    @IBOutlet weak var birthdayCheck: UIImageView!
    @IBOutlet weak var switchStateLabel: UILabel!
    @IBOutlet weak var switch1: UISwitch?
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var actionButton: UIButton!
    let dropDown = DropDown()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        deviceID.text = appDelegate.deviceID
        resetForm(self)
        firstName.addTarget(self, action: #selector(SignUpViewController.validateForm), forControlEvents: UIControlEvents.EditingChanged)
        lastName.addTarget(self, action: #selector(SignUpViewController.validateForm), forControlEvents: UIControlEvents.EditingChanged)
        email.addTarget(self, action: #selector(SignUpViewController.validateForm), forControlEvents: UIControlEvents.EditingChanged)
        city.addTarget(self, action: #selector(SignUpViewController.validateForm), forControlEvents: UIControlEvents.EditingChanged)
        backendless.initApp(APP_ID, secret:SECRET_KEY, version:VERSION_NUM)
        switch1!.addTarget(self, action: #selector(SignUpViewController.stateChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        switchStateLabel.text = "Yes"
        dropdownAction()
    }
    
    ///////////////////////////////////// DropDown ///////////////////////////////////////////////
    
    func dropdownAction(){
        
        dropDown.dataSource = [
            "Al","Ak","Az","Ar","Ca","Co","Ct","De","Fl","Ga","Hi","Id","Il","In","Ia","Ks","Ky","La","Me","Md","Ma","Mi","Mn","Ms","Mo","Mt","Ne","Nv","Nh","Nj","Nm","Ny","Nc","Nd","Oh","Ok","Or","Pa","Ri","Sc","Sd","Tn","Tx","Ut","Vt","Va","Wa","Wv","Wi","Wy"
        ]
        
        dropDown.selectionAction = { [unowned self] (index, item) in
            self.actionButton.setTitle(item, forState: .Normal)
            self.actionButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
            self.stateCheck.alpha = 1
            
            if self.stateCheck.alpha == 1 {
                self.birthdateTextField.enabled = true
            }
            
            
            
        }
        dropDown.anchorView = actionButton
        dropDown.bottomOffset = CGPoint(x: 0, y:actionButton.bounds.height)
        
        
    }
    
    
    @IBAction func showOrDismiss(sender: AnyObject) {
        
        
        if dropDown.hidden {
            dropDown.show()
        }else{
            dropDown.hide()
            
        }
        
    }
    
    ///////////////////////////// Birthday Datepicker ////////////////////////////////////////
    
    @IBAction func textFieldEditing(sender: UITextField) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(SignUpViewController.datePickerValueChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        birthdateTextField.text = dateFormatter.stringFromDate(sender.date)
        birthdayCheck.alpha = 1
        
        if birthdayCheck.alpha == 1 {
            
            self.nextButton.enabled = true
        }
    }
    
    
    //////////////////////////// Email Switch ///////////////////////////////////////////////
    
    
    func stateChanged(switchState: UISwitch) {
        
        if switchState.on {
            switchStateLabel.text = "Yes"
            print(switchStateLabel.text)
        }else{
            switchStateLabel.text = "No"
            print(switchStateLabel.text)
        }
    }
    
    
    /////////////////////////// Firebase ///////////////////////////////////////////////////
    
//    func reAuth(){
//        if appDelegate.failedAuth {
//            appDelegate.auth()
//        }
//    }
    
//    func firebase(){
//        
//        recordRef = appDelegate.ref.childByAutoId()
//        recordRef.setValue(["deviceID": deviceID.text!, "firstName": firstName.text!, "lastName": lastName.text!, "email": email.text!, "city": city.text!,"birthday": birthdateTextField.text!, "emailSubscribed": switchStateLabel.text! , "timestamp": [".sv":"timestamp"]])
//    }
    
    /////////////////////////// Backendless /////////////////////////////////////////
    
    func registerUser() {
        
        Types.tryblock({ () -> Void in
            let user = BackendlessUser()
            user.setProperty("firstname", object: self.firstName.text)
            user.setProperty("lastname", object: self.lastName.text)
            user.email = self.email.text
            user.setProperty("state", object: self.actionButton.titleLabel?.text)
            user.setProperty("city", object: self.city.text)
            user.setProperty("birthdate", object: self.birthdateTextField.text)
            user.password = "password"
            let registeredUser = self.backendless.userService.registering(user)
            print("User has been registered (SYNC): \(registeredUser)")
            
//            self.firebase()
            
            },
                       
               catchblock: { (exception) -> Void in
                print("Server reported an error: \(exception)" )
                let alertController = UIAlertController(title: "Oops", message: "An error has occurred, please try again", preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                }
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true) {
                }
        })
    }
    
    
    
    //////////////////////////////// Validation /////////////////////////////////////
    
    func validateForm() {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        firstNameCheck.alpha = firstName.text!.characters.count > 1 ? 1 : 0
        lastNameCheck.alpha = lastName.text!.characters.count > 1 ? 1 : 0
        emailCheck.alpha = emailTest.evaluateWithObject(email.text) ? 1 : 0
        cityCheck.alpha = city.text!.characters.count > 1 ? 1 : 0
        
        if cityCheck.alpha == 1 {
            
            actionButton.userInteractionEnabled = true
        }
    }
    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        if textField == firstName {
            lastName.becomeFirstResponder()
        }
        if textField == lastName {
            email.becomeFirstResponder()
        }
        if textField == email {
            city.becomeFirstResponder()
        }
        if textField == city {
            
            birthdateTextField.becomeFirstResponder()
            
        }
        if textField == birthdateTextField{
            
            actionButton.becomeFirstResponder()
            
        }
        
        return true
    }
    
    
    @IBAction func next(sender: AnyObject) {
        print(self.actionButton.titleLabel?.text)
        
        self.registerUser()
        self.performSegueWithIdentifier("picks", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "picks" {
//            let picksViewController = segue.destinationViewController as! PicksViewController
//            picksViewController.recordRef = recordRef
            
            resetForm(self)
        }
    }
    
    @IBAction func resetForm(sender: AnyObject) {
        firstName.text = ""
        lastName.text = ""
        email.text = ""
        city.text = ""
        birthdateTextField.text = "" 
        firstNameCheck.alpha = 0
        lastNameCheck.alpha = 0
        emailCheck.alpha = 0
        stateCheck.alpha = 0
        cityCheck.alpha = 0
        birthdayCheck.alpha = 0
        nextButton.enabled = false
        birthdateTextField.enabled = false
        actionButton.userInteractionEnabled = false
    }
    
    
    @IBAction func backPressed(sender: AnyObject) {
    
    [self.dismissViewControllerAnimated(true, completion: { 
        
    })]
    
    
    }
    
}

