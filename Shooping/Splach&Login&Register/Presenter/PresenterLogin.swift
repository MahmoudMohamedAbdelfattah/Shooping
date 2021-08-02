//
//  PresenterRegister.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 14/06/2021.
//

import Foundation

protocol delegatelogin {
    func ShowMessage (Message : String)
    func didSucess()
    func startSpinner()
    func endSpinner()
}

class presenterlogin : NSObject {
    
//    var ss = MessageMain.self
//    var ssdd : String = ""

    var delegate : delegatelogin!
    static var NameErooreApi : String?
    
    func VaildatLogin (Password :String? , Email :String?) {
    
        guard let email = Email?.trimed ,!email.isEmpty else {self.delegate.ShowMessage(Message: "Please Enter Email")
            return}
        guard let password = Password?.trimed ,!password.isEmpty else {self.delegate.ShowMessage(Message: "Please Enter Password")
            return}
            if !isPasswordVaild(pass: password){
             self.delegate.ShowMessage(Message: "يحب ادخال ٦ احرف علي الاقل")
             return
           }
        
        self.delegate.startSpinner()
        
        API.Login(email: email, password: password) { (errore, succes, module, messs) in
            print(email)
            if succes {
            print("succes")
            self.delegate.endSpinner()
            self.delegate.ShowMessage(Message: (module?.message)!)
                self.delegate.didSucess()
        
            } else {
            self.delegate.endSpinner()
            self.delegate.ShowMessage(Message: messs!)
        }
        }
        }
    
    
    
     func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z_%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func isValidPhone(phone: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
    }
    func isPasswordVaild(pass:String)->Bool{
            let passreges = "^(?=.*\\d).{6,12}$"
        let passwordtest = NSPredicate(format: "SELF MATCHES %@", passreges)

        return passwordtest.evaluate(with:pass )
    }
}


