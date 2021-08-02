//
//  RegisterView.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 09/06/2021.
//

import UIKit

class RegisterView: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate ,RegisterDelegat{
  
    @IBOutlet weak var ImageConfirmationPass: UIImageView!
    @IBOutlet weak var ImagePassword: UIImageView!
    @IBOutlet weak var ImageEmail: UIImageView!
    @IBOutlet weak var PhoneImage: UIImageView!
    @IBOutlet weak var ImageName: UIImageView!
    @IBOutlet weak var ViewConfirmPass: UIView!
    @IBOutlet weak var ViewPassword: UIView!
    @IBOutlet weak var ViewEmail: UIView!
    @IBOutlet weak var ViewPhone: UIView!
    @IBOutlet weak var ViewName: UIView!
    @IBOutlet var TextFilds: [UITextField]!
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var NameTXT: UITextField!
    @IBOutlet weak var phoneTXT: UITextField!
    @IBOutlet weak var EmailTXT: UITextField!
    @IBOutlet weak var PasswordTXT: UITextField!
    @IBOutlet weak var ConfirmPasswordTXT: UITextField!
    
    
    
    func ShowMessage(Message: String) {
        let alert = UIAlertController(title: "تنبيه", message: Message, preferredStyle: .actionSheet)
       self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
    
    if let popoverController = alert.popoverPresentationController {
        popoverController.sourceView = self.view //to set the source of your alert
        popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.maxY, width: 0, height: 0)
        
    }
    }
    

    
    var fffff : String = ""

    let imagepiker=UIImagePickerController()
    
    
    func ConvertImageToBase64String (img: UIImage) -> String {
        let imageData:NSData = img.jpegData(compressionQuality: 0.50)! as NSData //UIImagePNGRepresentation(img)
        let imgString = imageData.base64EncodedString(options: .init(rawValue: 0))
        return imgString
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        imagepiker.delegate=self
        imagepiker.sourceType = .photoLibrary
        imagepiker.allowsEditing=true
        //لجعل عندما يتم الضغط علي الصوره يعطيكaction
        let tapgest=UITapGestureRecognizer(target: self, action: #selector(RegisterView.chooseimage))
        ProfileImage.addGestureRecognizer(tapgest)
        ProfileImage.isUserInteractionEnabled=true
        presenter.delegate = self
        for text in TextFilds {
            text.delegate = self
        }


    }
    
    let presenter : RegisterPresenter = RegisterPresenter()


    @objc func chooseimage()  {
        let alertcon=UIAlertController(title: "اختر الصوره", message: "من اي مصدر تريد احضار الصوره", preferredStyle: .actionSheet)
        let camera=UIAlertAction(title: "الكاميرا", style:.default) {[weak self] (ـ) in
            self?.imagepiker.sourceType = .camera
            if self != nil{
            self?.present(self!.imagepiker,animated: true,completion: nil)
            }}

        let photo=UIAlertAction(title: "الصور", style:.default) {[weak self] (ـ) in
            self?.imagepiker.sourceType = .photoLibrary
            if self != nil{
                self?.present(self!.imagepiker,animated: true,completion: nil)
            }}
        let cancel=UIAlertAction(title: "الغاء", style: .cancel, handler: nil)

        alertcon.addAction(cancel)
        alertcon.addAction(camera)
        alertcon.addAction(photo)
        present(alertcon,animated: true,completion: nil)

    }
    
    @IBAction func RegisterButt(_ sender: UIButton) {
        self.presenter.VaildData(Name: NameTXT.text?.trimed ?? "", Image: fffff , Phone: phoneTXT.text ?? "", Password: PasswordTXT.text ?? "", Email: EmailTXT.text ?? "")
    }
    
    @IBAction func BackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func didSucess() {
        let window = UIApplication.shared.windows.filter({return $0.isKeyWindow}).first!
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let navVC = storyboard.instantiateViewController(identifier:"HomeView") as! UINavigationController
        window.rootViewController = navVC
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
}
