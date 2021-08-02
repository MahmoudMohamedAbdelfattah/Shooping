//
//  ExtenitionSignIn.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 18/07/2021.
//

import Foundation
import UIKit

extension SignInViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0{
            if textField.text!.isEmpty{
                self.ImageEmail.image = UIImage(named: "Subtraction 1")
                ViewEmail.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
            }else{
                self.ImageEmail.image = UIImage(named: "Subtraction 1-1")
                ViewEmail.layer.borderColor = UIColor.black.cgColor
            }
            
        } else
        {
            if textField.text!.isEmpty {
                ViewPassword.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
                self.ImagePassword.image = UIImage(named: "password")
             
            } else {
                ViewPassword.layer.borderColor = UIColor.black.cgColor
                self.ImagePassword.image = UIImage(named: "password1")
            }
        }
}
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            ViewEmail.layer.borderColor = UIColor.black.cgColor
            self.ImageEmail.image = UIImage(named: "Subtraction 1-1")
            
        } else {
            ViewPassword.layer.borderColor = UIColor.black.cgColor
            self.ImagePassword.image = UIImage(named: "password1")
        }
    }
    
}
