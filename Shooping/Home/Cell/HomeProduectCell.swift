//
//  HomeProduectCell.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 22/06/2021.
//

import UIKit

class HomeProduectCell: UICollectionViewCell {

    @IBOutlet weak var stackViewINFO: UIStackView!
    @IBOutlet weak var DescountProductLbl: UILabel!
    @IBOutlet weak var PriceProductLbl: UILabel!
    @IBOutlet weak var ProductNameLbl: UILabel!
    @IBOutlet weak var ImageProduct: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        ImageProduct.layer.borderColor = UIColor.black.cgColor
        ImageProduct.layer.borderWidth = 2
        ImageProduct.layer.cornerRadius = 10

        // Initialization code
    }
    
    func AddInfoCelll (NameModule : AllProducts) {
        ImageProduct.image = UIImage(named: NameModule.image!)
        PriceProductLbl.text = "\(String(describing: NameModule.price!))جنيه "
        DescountProductLbl.text = "\(String(describing: NameModule.discount!)) %"
        ProductNameLbl.text = NameModule.name!
    }

}
