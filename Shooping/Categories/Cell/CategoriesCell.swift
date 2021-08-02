//
//  CategoriesCell.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 27/06/2021.
//

import UIKit

class CategoriesCell: UITableViewCell {

    @IBOutlet weak var NameProduct: UILabel!
    @IBOutlet weak var ImageProductCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ImageProductCell.layer.borderColor = UIColor.purple.cgColor
        ImageProductCell.layer.borderWidth = 2
        ImageProductCell.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func AddInfoCell (NameModule : DataInfo) {
        
        ImageProductCell.image = UIImage(named: NameModule.image!)
        NameProduct.text = NameModule.name
        print("cellllllll")
       // print(NameModule.category?.name)
     
    }
    
}
