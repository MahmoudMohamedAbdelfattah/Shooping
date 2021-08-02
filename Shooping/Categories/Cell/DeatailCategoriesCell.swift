//
//  DeatailCategoriesCell.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 28/06/2021.
//

import UIKit
import Kingfisher
class DeatailCategoriesCell: UICollectionViewCell {

    @IBOutlet weak var DescripitionText: UITextView!
    @IBOutlet weak var IMGProductDeatial: UIImageView!
    @IBOutlet weak var DescripitionLbl: UILabel!
    @IBOutlet weak var NewPriceLbl: UILabel!
    @IBOutlet weak var descountLbl: UILabel!
    @IBOutlet weak var OldPriceLbl: UILabel!
    @IBOutlet weak var NameProductLbl: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        IMGProductDeatial.layer.borderColor = UIColor.purple.cgColor
        IMGProductDeatial.layer.borderWidth = 2
        IMGProductDeatial.layer.cornerRadius = 10
        // Initialization code
    }
    
    func AddInfoCell (NameModule : DataAll) {
        IMGProductDeatial.image = UIImage(named: NameModule.image ?? "")
        NameProductLbl.text = NameModule.name
        OldPriceLbl.text = "\(String(describing: NameModule.old_price!))جنيه "
        NewPriceLbl.text = "\(String(describing: NameModule.price!))جنيه "
        descountLbl.text = "\(String(describing: NameModule.discount!)) % "
        DescripitionText.text = "\(String(describing: NameModule.description!))"
        print("cellllllll")
       // print(NameModule.category?.name)
    }
    
    func AddInfoCelllImage (image : String) {
        let Path = image
        if let url = URL(string: Path) {
            self.IMGProductDeatial.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
    }
    }

}
