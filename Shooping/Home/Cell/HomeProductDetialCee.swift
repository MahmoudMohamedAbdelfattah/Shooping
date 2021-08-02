//
//  HomeProductDetialCee.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 23/06/2021.
//

import UIKit
import Kingfisher
class HomeProductDetialCee: UICollectionViewCell {

    @IBOutlet weak var ImagesProduct: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func AddInfoCelll (image : String) {
        let Path = image
        if let url = URL(string: Path) {
            self.ImagesProduct.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
    }
    }
}
