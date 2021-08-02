//
//  ExtenitionRegister.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 10/06/2021.
//

import Foundation
import UIKit

extension RegisterView  : UITextFieldDelegate {
   
    func textFieldDidEndEditing(_ textField: UITextField) {
      
        if textField.tag == 0{
            if textField.text!.isEmpty{
                self.ImageName.image = UIImage(named: "Subtraction 3")
                ViewName.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
            }else{
                self.ImageName.image = UIImage(named: "Subtraction 3-1")
                ViewName.layer.borderColor = UIColor.black.cgColor
            }
        }
        else if textField.tag == 1 {
            if textField.text!.isEmpty {
                ViewPhone.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
                self.PhoneImage.image = UIImage(named: "phone")
            
            } else {
                ViewPhone.layer.borderColor = UIColor.black.cgColor
                self.PhoneImage.image = UIImage(named: "phone-1")
            }
        }
        else if textField.tag == 2 {
            if textField.text!.isEmpty {
                ViewEmail.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
                self.ImageEmail.image = UIImage(named: "Subtraction 1")
                
            } else {
                ViewEmail.layer.borderColor = UIColor.black.cgColor
                self.ImageEmail.image = UIImage(named: "Subtraction 1-1")
                }
        }
        else if textField.tag == 3 {
            if textField.text!.isEmpty {
                ViewPassword.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
                self.ImagePassword.image = UIImage(named: "password")
                
            } else {
                ViewPassword.layer.borderColor = UIColor.black.cgColor
                self.ImagePassword.image = UIImage(named: "password1")
            }
            
        } else if textField.tag == 4 {
            if textField.text!.isEmpty {
                ViewConfirmPass.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
                self.ImageConfirmationPass.image = UIImage(named: "password")
                
            } else {
                ViewConfirmPass.layer.borderColor = UIColor.black.cgColor
                self.ImageConfirmationPass.image = UIImage(named: "password1")
                
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
           if textField.tag == 0 {
            ViewName.layer.borderColor = UIColor.black.cgColor
            self.ImageName.image = UIImage(named: "Subtraction 3-1")
        } else if textField.tag == 1 {
            ViewPhone.layer.borderColor = UIColor.black.cgColor
            self.PhoneImage.image = UIImage(named: "phone-1")
        } else if textField.tag == 2 {
            ViewEmail.layer.borderColor = UIColor.black.cgColor
            self.ImageEmail.image = UIImage(named: "Subtraction 1-1")
        }else if textField.tag == 3 {
            
            ViewPassword.layer.borderColor = UIColor.black.cgColor
            self.ImagePassword.image = UIImage(named: "password1")
            
        }else if textField.tag == 4 {
            ViewConfirmPass.layer.borderColor = UIColor.black.cgColor
            self.ImageConfirmationPass.image = UIImage(named: "password1")
        }
    }

    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        let theimage=info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        
        ProfileImage.image=theimage
        
        self.fffff =  ConvertImageToBase64String(img: theimage)
        dismiss(animated: true, completion: nil)
    }
    
   //عندما تضغط علcancel
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        
         dismiss(animated: true, completion: nil)
    }
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {view.endEditing(true)}
  
   
    }
