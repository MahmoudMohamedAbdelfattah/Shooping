//
//  SignInViewController.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 08/06/2021.
//

import UIKit

class SignInViewController: UIViewController , delegatelogin{

    
    @IBOutlet weak var Spinner: UIActivityIndicatorView!
    @IBOutlet weak var ButtonShowPassword: UIButton!
    @IBOutlet weak var ImageEmail: UIImageView!
    @IBOutlet weak var ImagePassword: UIImageView!
    @IBOutlet weak var EmailTXT: UITextField!
    @IBOutlet weak var PasswordTXT: UITextField!
    @IBOutlet var TextFilds: [UITextField]!
    @IBOutlet weak var ViewEmail: BorderViewText!
    @IBOutlet weak var ViewPassword: BorderViewText!
    
    
    func ShowMessage(Message: String) {
        let alert = UIAlertController(title: "تنبيه", message: Message, preferredStyle: .actionSheet)
       self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
    
    if let popoverController = alert.popoverPresentationController {
        popoverController.sourceView = self.view //to set the source of your alert
        popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.maxY, width: 0, height: 0)
        
    }
        
    }
    
    let presenter : presenterlogin = presenterlogin()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Spinner.hidesWhenStopped = true
        presenter.delegate = self
        
        for text in TextFilds {
            text.delegate = self
        }

        // Do any additional setup after loading the view.
    }


    @IBAction func ButtRegister(_ sender: UIButton) {
        
        let VCCountry: RegisterView = RegisterView()
        self.navigationController!.pushViewController(VCCountry, animated: true)
    }
    
    @IBAction func ButtLogin(_ sender: UIButton) {
        self.presenter.VaildatLogin(Password: PasswordTXT.text, Email: EmailTXT.text)

      
    }
    
    var iconClick = true

    @IBAction func ShowPasswordButton(_ sender: UIButton) {
   // self.ImagePassword.image = UIImage(named: "password1")
//        self.PasswordTXT.isSecureTextEntry = !self.PasswordTXT.isSecureTextEntry
        if PasswordTXT.isSecureTextEntry {
            ButtonShowPassword.setImage(UIImage(named: "showeye"), for: .normal)
            self.PasswordTXT.isSecureTextEntry = false

        } else {
            ButtonShowPassword.setImage(UIImage(named: "show"), for: .normal)
            self.PasswordTXT.isSecureTextEntry = true
        }
    }
    
    func startSpinner() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "spinner") as? ViewControllerSpinner {
         vc.modalPresentationStyle = .overCurrentContext
         present(vc, animated: true, completion: nil)
        }
    }
    
    func endSpinner() {
        dismiss(animated: true, completion: nil)
    }
    

    
    func didSucess() {
        let window = UIApplication.shared.windows.filter({return $0.isKeyWindow}).first!
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let navVC = storyboard.instantiateViewController(identifier: "nnn") as! UINavigationController
        window.rootViewController = navVC
    }
}
