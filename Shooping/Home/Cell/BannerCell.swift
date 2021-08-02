//
//  BannerCell.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 18/06/2021.
//

import UIKit

class BannerCell: UICollectionViewCell {

    @IBOutlet weak var ImageBanner: UIImageView!
    @IBOutlet weak var NameTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
     
    func AddInfoCell (NameModule : AllBanners) {
        
        ImageBanner.image = UIImage(named: NameModule.image!)
        NameTitleLbl.text = NameModule.category?.name
        print("cellllllll")
       // print(NameModule.category?.name)
     
    }
}
