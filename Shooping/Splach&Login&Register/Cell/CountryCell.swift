//
//  CountryCell.swift
//  Shooping
//
//  Created by Mahmoud Mohmed on 08/06/2021.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var NameCountry: UILabel!
    @IBOutlet weak var IMGFlageCountry: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func AddInfoCell (namemodule : ProgramingModulepresenter) {
        
        IMGFlageCountry.image = UIImage(named: namemodule.image!)
        NameCountry.text = namemodule.name
    }
}
