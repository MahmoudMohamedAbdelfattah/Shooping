//
//  SplachCellCell.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 08/06/2021.
//

import UIKit


class SplachCellCell: UICollectionViewCell {
    
    @IBOutlet weak var ImageSplach: UIImageView!
    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var DescripitionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    // change uiimage to string
//    func stupCellSplach ( title : String , titleDes : String , IMG : String ) {
//        ImageSplach.image = UIImage(named: IMG)
//        TitleLbl.text = title
//        DescripitionLbl.text = titleDes
//    }
    
    func AddInfoCell (namemodule : ProgramingModulepresenter) {
        
        ImageSplach.image = UIImage(named: namemodule.image!)
        TitleLbl.text = namemodule.titleDescripition
        DescripitionLbl.text = namemodule.name
    }

}
