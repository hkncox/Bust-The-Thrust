//
//  User.swift
//  BTT
//
//  Created by Nicole Talley on 1/16/16.
//  Copyright © 2016 Nicole Talley. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
class User
{
    var firstName = ""
    var lastName = ""
    var userName = ""
    var password = ""
    var email = ""
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    func User(_firstName: String, _lastName: String, _userName: String, _password: String, _email: String)
    {
        firstName = _firstName;
        lastName = _lastName;
        userName = _userName;
        password = _password;
        email = _email;
    }
    func validate(_firstName: String, _lastName: String, _userName: String, _password: String, _email: String)
    {
        if !(isValidEmail(emailTextField.text!))
        {
            emailTextField.text = "Invalid email. Please try again"
        }
        
       
    }
    func isValidEmail(testStr:String) -> Bool {
        
        print("validate emilId: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluateWithObject(testStr)
        return result
        
    }
}