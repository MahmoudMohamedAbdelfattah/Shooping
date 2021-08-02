//
//  PresenterRegister.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 14/06/2021.
//

import Foundation




protocol RegisterDelegat {
    func ShowMessage (Message : String)
    func didSucess()
    func startSpinner()
    func endSpinner()
}




class RegisterPresenter : NSObject {
    
//    var ss = MessageMain.self
//    var ssdd : String = ""

    var delegate : RegisterDelegat!
    static var NameErooreApi : String?
    
    func VaildData (Name : String?, Image : String? , Phone : String? , Password : String? , Email : String?) {
        
        guard let name = Name?.trimed ,!name.isEmpty else {
            self.delegate.ShowMessage(Message: "Please Enter Your Name")
            return }
        guard let image = Image,!image.isEmpty else {self.delegate.ShowMessage(Message: "Please Choose Your Image")
            return}
        guard let phone = Phone?.trimed ,!phone.isEmpty else { self.delegate.ShowMessage(Message: "Please Enter Phone")
            return}
        if !(Phone?.isPhoneNumber ?? false){
         self.delegate.ShowMessage(Message: "ادخل رقم الجوال بشكل صحيح")
         return
        }
        guard let email = Email?.trimed ,!email.isEmpty else {self.delegate.ShowMessage(Message: "Please Enter Email")
            return}

        guard let password = Password?.trimed ,!password.isEmpty else {self.delegate.ShowMessage(Message: "Please Enter Password")
            return}
            if !isPasswordVaild(pass: password){
             self.delegate.ShowMessage(Message: "يحب ادخال ٦ احرف علي الاقل")
             return
           }
        self.delegate.startSpinner()
        API.register(name: name , email: email, password: password, phone: phone , Photo: image) {  (errorre , succes , message ) in
         if succes {
            self.delegate.endSpinner()
            self.delegate.ShowMessage(Message: message ?? "")
                self.delegate.didSucess()
            print ("Register success ")
        } else {
            self.delegate.endSpinner()
            self.delegate.ShowMessage(Message: message!)
        //    ssdd = message!

            print( message!)
            print("errrror")
        }
    }
        }
    
    
    
     func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
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

extension String {
    var isPhoneNumber:Bool{
        do{let detctor=try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let match = detctor.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res=match.first{return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && (self.count >= 8 && self.count <= 15)}else{return false}
        }catch{
            return false}
        }
}
